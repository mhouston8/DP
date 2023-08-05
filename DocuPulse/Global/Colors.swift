//
//  Colors.swift
//  DocuPulse
//
//  Created by Matthew Houston on 8/5/23.
//

import Foundation
import UIKit
import SwiftUI


struct Colors {
    
    var redGradient: LinearGradient {
        return LinearGradient(colors: [Color(red: 245 / 255, green: 72 / 255, blue: 74 / 255)], startPoint: .leading, endPoint: .trailing)
    }
    
    var yellowGradient: LinearGradient {
        return LinearGradient(colors: [Color(red: 248 / 255, green: 147 / 255, blue: 74 / 255)], startPoint: .leading, endPoint: .trailing)
    }
    
    var blueGradient: LinearGradient {
        return LinearGradient(colors: [Color(red: 75 / 255, green: 104 / 255, blue: 74 / 255)], startPoint: .leading, endPoint: .trailing)
    }
    
    static func redGradient() -> LinearGradient {
        return LinearGradient(colors: [Color(red: 245 / 255, green: 72 / 255, blue: 74 / 255)], startPoint: .leading, endPoint: .trailing)
    }
    
    static func yellowGradient() -> LinearGradient {
        return LinearGradient(colors: [Color(red: 248 / 255, green: 147 / 255, blue: 74 / 255)], startPoint: .leading, endPoint: .trailing)
    }
    
    static func blueGradient() -> LinearGradient {
        return LinearGradient(colors: [Color(red: 75 / 255, green: 104 / 255, blue: 74 / 255)], startPoint: .leading, endPoint: .trailing)
    }
    
}
