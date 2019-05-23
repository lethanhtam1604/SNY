//
//  ArticleWrapper.swift
//  SNY
//
//  Created by Thanh-Tam Le on 17/04/2019.
//  Copyright © 2019 Thanh-Tam Le. All rights reserved.
//

import UIKit
import Alamofire

class ArticleWrapper: APIWrapper {

    private static func api(_ api: ArticleRouter.APIs) -> ArticleRouter {
        return api.create()
    }
    
    @discardableResult
    static func getEmailed(loader: Bool = false, key: String, _ completion: @escaping (_ data: EmailedArticle?, _ error: String?)->()) -> DataRequest? {
        return performAPICall(loader: loader, api(.emailed(key))) { (model, error) in
            completion(model as? EmailedArticle, error)
        }
    }
}
