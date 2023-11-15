//
//  Document.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/25/23.
//

import Foundation 
import UIKit
import RealmSwift


struct Document {
    let id = UUID()
    let title: String
    let type: String
    let thumbnail: UIImage
    let date: Date
}

class RealmDocument: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var title: String = ""
    @Persisted var date: Date = Date()
    
    convenience init(title: String, date: Date) {
        self.init()
        self.title = title
        self.date = date
    }
    
    //@Persisted var thumbnail: UIImage
}
