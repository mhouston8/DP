//
//  ImageCache.swift
//  DocuPulse
//
//  Created by Matthew Houston on 1/20/24.
//

import Foundation
import UIKit


class ImageCache {
    
    static let shared = ImageCache()
    private init() {}
    
    private var cache = NSCache<NSString, UIImage>()
    
    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    func image(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
}
