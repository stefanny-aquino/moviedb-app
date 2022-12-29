//
//  ImageModel.swift
//  MovieDB
//
//  Created by Stefanny Aquino on 26/12/22.
//

import Foundation
import SwiftUI

class ImageModel: ObservableObject {
    @Published var image: UIImage?
    var imageUrl: String?
    var imageCache = ImageCache.getCachedImage()
    
    init(imageUrl: String?) {
        self.imageUrl = imageUrl
        loadImage()
    }
    
    func loadImage() {
        if getImageFromCache() {
            return
        }
        getImageFromUrl()
    }
    
    func getImageFromCache() -> Bool {
        guard let imageUrl = imageUrl, let cacheImage = imageCache.get(key: imageUrl) else {
            return false
        }
        image = cacheImage
        
        return true
    }
    
    func getImageFromUrl() {
        guard let imageUrl = imageUrl else { return }
        let url = URL(string: imageUrl)!
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let data = data {
                DispatchQueue.main.async {
                    guard let remoteImage = UIImage(data: data) else {
                        return
                    }
                    self.imageCache.set(key: self.imageUrl!, image: remoteImage)
                    self.image = remoteImage
                }
            }
        }).resume()
    }
}

class ImageCache {
    var cache = NSCache<NSString, UIImage>()
    
    func get(key: String) -> UIImage? {
        return cache.object(forKey: NSString(string: key))
    }
    
    func set(key: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: key))
    }
}

extension ImageCache {
    private static var imageCache = ImageCache()
    
    static func getCachedImage() -> ImageCache {
        return imageCache
    }
}

