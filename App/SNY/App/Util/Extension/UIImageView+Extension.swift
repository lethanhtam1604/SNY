//
//  UIImageView.swift
//  SNY
//
//  Created by Thanh-Tam Le on 15/11/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func loadImagesUsingUrlString(urlString: String, completion: (() -> ())? = nil) {
        self.loadImagesUsingUrlString(urlString: urlString, placeholderImage: nil, completion: completion)
    }
    
    func loadImagesUsingUrlString(urlString: String, placeholderImage: UIImage?, completion: (() -> ())? = nil) {
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            completion?()
            return
        }
        image = placeholderImage
        
        ImageWrapper.download(urlString: urlString) { (data, error) in
            if let newData = data, let newImage = UIImage.init(data: newData) {
                self.image = newImage
                imageCache.setObject(newImage, forKey: urlString as AnyObject)
            }
            completion?()
        }
    }
}

