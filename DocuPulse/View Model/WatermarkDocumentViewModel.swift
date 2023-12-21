//
//  WatermarkDocumentViewModel.swift
//  DocuPulse
//
//  Created by Matthew Houston on 12/19/23.
//

import Foundation
import SwiftUI
import UIKit

class WatermarkDocumentViewModel: ObservableObject {
    
    @Published var originalImage: UIImage?
    
    private var database = FirebaseDBWrapper()
    private var storage = FirebaseStorageWrapper()
    
    func fetchImage(from url: URL) {
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let error = error {
                print("")
            }
            
            if let data = data {
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self.originalImage = UIImage(data: data)
                    print("")
                }
            }
        }
        .resume()
    }
    
    
    func updateDocument(document: Document, watermarkedImage: UIImage) {
        self.storage.updateDocument(document: document, with: watermarkedImage, completion: { success in
            if success {
                print("")
            } else {
                print("")
            }
        })
    }
    
}
