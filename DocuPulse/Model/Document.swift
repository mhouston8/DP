//
//  Document.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/25/23.
//

import Foundation 
import UIKit
import RealmSwift


struct Document: Codable, Identifiable {
    
    var id: String { //computed property
        documentID
    }
    var documentID: String = ""
    var title: String
    var imageURL: String
    var mimeType: String
    var date: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case imageURL = "fileURL"
        case date
        case mimeType = "mimeType"
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
