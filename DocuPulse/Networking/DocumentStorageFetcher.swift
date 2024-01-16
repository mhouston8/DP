//
//  DocumentStorageFetcher.swift
//  DocuPulse
//
//  Created by Matthew Houston on 12/31/23.
//

import Foundation
import UIKit


struct DocumentStorageFetcher {
    
    func fetchDocumentFromStorage(fromURL url: URL, completion: @escaping(Data?) -> Void) {
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let error = error {
                print("")
                completion(nil)
            }
            
            if let data = data {
                DispatchQueue.main.async {
                    if let image = UIImage(data: data) {
                        completion(data)
                    } else {
                        completion(data)
                    }
                }
            }
        }
        .resume()
    }
    
}
