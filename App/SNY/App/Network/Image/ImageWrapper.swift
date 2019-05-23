//
//  ImageWrapper.swift
//  SNY
//
//  Created by Thanh-Tam Le on 23/05/2019.
//  Copyright © 2019 Thanh-Tam Le. All rights reserved.
//

import UIKit
import Alamofire

class ImageWrapper: APIWrapper {
    
    private static func api(_ api: ImageRouter.APIs) -> ImageRouter {
        return api.create()
    }
    
    @discardableResult
    static func download(loader: Bool = false, urlString: String, _ completion: @escaping (_ data: Data?, _ error: String?)->()) -> DataRequest? {
        return performAPICall(loader: loader, api(.download(urlString))) { (model, error) in
            completion(model as? Data, error)
        }
    }
}
