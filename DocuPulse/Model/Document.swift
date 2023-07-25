//
//  Document.swift
//  DocuPulse
//
//  Created by Matthew Houston on 7/25/23.
//

import Foundation
import UIKit

struct Document {
    let id = UUID()
    let title: String
    let type: String
    let thumbnail: UIImage
    let date: Date
}
