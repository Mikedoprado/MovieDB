//
//  CacheImageView.swift
//  MovieDB
//
//  Created by Michael Conchado on 19/12/22.
//

import UIKit

class CacheImageView: UIImageView {
    
    private var imageCache: NSCache<NSString, DiscardableImageCacheItem> {
        let cache = NSCache<NSString, DiscardableImageCacheItem>()
        cache.countLimit = 20
        cache.totalCostLimit = 200
        return cache
    }
    
    private var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .large
        return activityIndicator
    }()
    
    private var urlStringForChecking: String?
    
    var emptyImage: UIImage?
    
    func loadImage(urlString: String?, completion: (() -> Void)? = nil) {
        self.showLoading(view: &activityIndicator)
        image = nil
        
        guard urlString != nil else {
            image = emptyImage
            stopLoading(view: &activityIndicator)
            return
        }
        
        self.urlStringForChecking = urlString
        guard let urlKey = urlString as NSString?, let url = URL(string: urlString!) else { return }
        
        if let cachedItem = imageCache.object(forKey: urlKey) {
            image = cachedItem.image
            completion?()
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                if let imageData = UIImage(data: data)?.jpegData(compressionQuality: 0.5) {
                    if let newImageSmaller = UIImage(data: imageData) {
                        let cacheItem = DiscardableImageCacheItem(image: newImageSmaller)
                        self.imageCache.setObject(cacheItem, forKey: urlKey)
                        if urlString == self.urlStringForChecking {
                            self.image = newImageSmaller
                            self.stopLoading(view: &self.activityIndicator)
                            completion?()
                        }
                    }
                }
            }
        }
        task.resume()
    }
    
}
