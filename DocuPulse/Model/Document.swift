//
//  Document.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/25/23.
//

import Foundation 
import UIKit
import RealmSwift
import FirebaseFirestore
import FirebaseFirestoreSwift


struct Document: Codable, Identifiable {
    
    var id: String?
    var title: String
    var fileURL: String
    var mimeType: String
    var date: String
    var mediaCount: Int?
    var batchFiles: [String]?
    
    //convert to date property from string on demand
    var dateString: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
        return dateFormatter.date(from: date)
    }
    
    var documentThumbnail: UIImage?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case fileURL
        case mimeType
        case date
        case mediaCount
        case batchFiles
    }
}
