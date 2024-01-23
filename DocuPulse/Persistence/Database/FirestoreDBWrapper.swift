//
//  FirestoreDBWrapper.swift
//  DocuPulse
//
//  Created by Matthew Houston on 11/15/23.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth

class FirebaseDBWrapper {
    let databaseReference = Firestore.firestore()
    let storageReference = Storage.storage().reference()
    
    func saveUser(user: User) {
        databaseReference.collection("users").document(Auth.auth().currentUser!.uid).setData([:]) { error in
            if let error = error {
                print("\(error.localizedDescription)")
            } else {
                print("")
            }
        }
    }
    
    func readAllDocuments(completion: @escaping ([Document]) -> Void) {
        guard let userID = Auth.auth().currentUser?.uid else {
            completion([])
            return
        }
        
        let allUserDocumentsReference = databaseReference.collection("users").document(userID).collection("documents").order(by: "date", descending: true)
        
        allUserDocumentsReference.getDocuments { snapshot, error in
            if let error = error {
                print("\(error.localizedDescription)")
                completion([])
                return
            }
            
            
            if snapshot!.documents.count > 0 {
                var docs = [Document]()
                
                let dispatchGroup = DispatchGroup()
                
                for document in snapshot!.documents {
                    let dataDictionaryRepresentation = self.prepareDataForDecoding(document: document)
                    guard let dataJSONRepresentation = try? JSONSerialization.data(withJSONObject: dataDictionaryRepresentation) else {
                        return
                    }
                    
                    let decoder = JSONDecoder()
                    do {
                        var doc = try decoder.decode(Document.self, from: dataJSONRepresentation)
                        let imageFetcher = DocumentStorageFetcher()
//                        imageFetcher.fetchDocumentFromStorage(fromURL: URL(string: doc.fileURL)!) { data in
//
//                            if doc.mimeType == "pdf" {
//                                doc.documentThumbnail = self.convertPDFDataToUIImage(pdfData: data!)
//                            } else {
//                                doc.documentThumbnail = UIImage(data: data!)
//                            }
//                            docs.append(doc)
//                        }
                        docs.append(doc)
                    } catch let jsonError {
                        print(jsonError)
                    }
                }
                completion(docs)
            } else {
                completion([])
            }
        }
    }
    
    func prepareDataForDecoding(document: QueryDocumentSnapshot) -> [String: Any] {
        var data = document.data() //turns document into dictionary
        data["id"] = document.documentID
        print(document.documentID)
        
        //convert firestore timestamp to date
        if let timestamp = data["date"] as? Timestamp {
            data["date"] = timestamp.dateValue()
        }
        
        return data
    }
    
    func convertPDFDataToUIImage(pdfData: Data) -> UIImage? {
        // Step 1: Create a CGPDFDocument
        guard let provider = CGDataProvider(data: pdfData as CFData),
              let pdfDocument = CGPDFDocument(provider),
              let page = pdfDocument.page(at: 1) else {
            print("Oops! Something went wrong with the PDF.")
            return nil
        }

        // Step 2: Draw the PDF page into a CGContext
        let pageRect = page.getBoxRect(.mediaBox)
        UIGraphicsBeginImageContext(pageRect.size)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }

        context.saveGState()
        context.translateBy(x: 0.0, y: pageRect.size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.drawPDFPage(page)
        context.restoreGState()

        // Step 3: Create UIImage from the context
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }
    
    func readBatchDocuments(byID documentID: String, completion: @escaping ([Document]) -> Void) {
        guard let currentUser = Auth.auth().currentUser else {
            completion([])
            return
        }
        
        let documentsRef = self.databaseReference.collection("users").document(currentUser.uid).collection("documents").whereField(FieldPath.documentID(), isEqualTo: documentID)
        
        documentsRef.getDocuments { snapshot, error in
            if let error = error {
                print("")
                completion([])
                return
            }
            
            guard let unwrappedSnapshot = snapshot else {
                completion([])
                return
            }
            
            var docs = [Document]()
            
            for document in unwrappedSnapshot.documents {
                guard let dataJSONRepresentation = try? JSONSerialization.data(withJSONObject: document.data()) else {
                    return
                }
                
                let decoder = JSONDecoder()
                do {
                    let doc = try decoder.decode(Document.self, from: dataJSONRepresentation)
                    docs.append(doc)
                } catch let jsonError {
                    print(jsonError)
                    completion(docs)
                }
            }
            
            completion(docs)
        }
    }
    
    func updateDocument(document: Document, with password: String, completion: @escaping (Bool) -> Void) {
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        
        let documentSchema = ["isProtected": true, "documentPassword" : password] as [String : Any]
        
        let documentReference  = self.databaseReference.collection("users").document(currentUser.uid).collection("documents").document(document.id!).updateData(documentSchema) { error in
            if let error = error {
                print("")
                completion(false)
            } else {
                completion(true)
                print("success")
            }
        }
    }
    
    func deleteDocument(document: Document, completion: @escaping (Bool) -> Void) {
        guard let currentUser = Auth.auth().currentUser else {
            completion(false)
            return
        }
        
        let documentReference  = self.databaseReference.collection("users").document(currentUser.uid).collection("documents").document(document.id!)
        
        documentReference.delete { error in
            if let error = error {
                print("error")
                completion(false)
            } else {
                completion(true)
            }
        } 
    }
}
