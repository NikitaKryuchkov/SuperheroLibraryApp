//
//  HeroImageView.swift
//  SuperheroLibrary
//
//  Created by Nikita Kryuchkov on 03.10.2021.
//

import UIKit

let imageCache = NSCache<NSString, AnyObject>()

class HeroImageView: UIImageView {
    
    func cacheImage(url: String){
        guard let url = URL(string: url) else { return }
        
        if let imageFromCache = imageCache.object(forKey: url.absoluteString as NSString) as? UIImage {
            self.image = imageFromCache
            return
        } else {
            DataFetcherService.shared.fetchImage(url: url) { data in
                guard let imageToCache = UIImage(data: data) else { return }
                self.image = imageToCache
                imageCache.setObject(imageToCache, forKey: url.absoluteString as NSString)
            }
        }
    }
}
