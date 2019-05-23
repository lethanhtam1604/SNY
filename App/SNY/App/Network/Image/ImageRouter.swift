//
//  ImageRouter.swift
//  SNY
//
//  Created by Thanh-Tam Le on 23/05/2019.
//  Copyright © 2019 Thanh-Tam Le. All rights reserved.
//

import UIKit
import Alamofire

class ImageRouter: BaseRouter {
    
    enum APIs {
        case download(String)
        case none
        
        public func create() -> ImageRouter {
            return ImageRouter(api: self)
        }
    }
    
    init(api: APIs) {
        self.api = api
        super.init()
    }
    
    var api: APIs
    
    override var method: HTTPMethod {
        switch api {
        case .download:
            return .get
        default:
            return .post
        }
    }
    
    override var header: HTTPHeaders {
        switch api {
        case .download:
            return [:]
        default:
            return Utils.getGenericHeader()
        }
    }
    
    override var isForDownloadImage: Bool {
        switch api {
        case .download:
            return true
        default:
            return false
        }
    }
    
    override var path: String {
        switch self.api {
        case .download(let url):
            return url
        default:
            return ""
        }
    }
    
    override func finalRequest() throws -> URLRequest {
        let url = try baseURLString.asURL()
        var urlRequest: URLRequest!
        if self.isForDownloadImage {
            urlRequest = URLRequest(url: URL.init(string: path)!)
            urlRequest.httpMethod = method.rawValue
            urlRequest.allHTTPHeaderFields = header
            return urlRequest
        }
        urlRequest = URLRequest(url: URL.init(string: "\(url.absoluteString)\(path)")!)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = header
        switch self.api {
        default:
            urlRequest = try URLEncoding.default.encode(urlRequest, with: nil)
        }
        urlRequest.timeoutInterval = TimeInterval(CONNECTION_TIMEOUT)
        return urlRequest
    }
}
