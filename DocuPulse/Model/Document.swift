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
    
    var id: String = ""
    var title: String
    var imageURL: String
    var mimeType: String
    var dateString: String
    
    //convert to date property from string on demand
    var date: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
        return dateFormatter.date(from: dateString)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case imageURL = "fileURL"
        case mimeType
        case dateString = "date"
    }
    
    //decodable init
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.title = try container.decode(String.self, forKey: .title)
//        self.imageURL = try container.decode(String.self, forKey: .imageURL)
//        self.mimeType = try container.decode(String.self, forKey: .mimeType)
//        
//        
//        //convert this string date to a date
//        var dateString = try container.decode(String.self, forKey: .date)
//        
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd"
//        guard let date = formatter.date(from: dateString) else {
//            throw DecodingError.dataCorruptedError(forKey: .date, in: container, debugDescription:"Date string does not match format.")
//            }
//        self.date = date
//    }
}
