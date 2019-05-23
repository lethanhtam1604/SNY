//
//  ArticleRouter.swift
//  SNY
//
//  Created by Thanh-Tam Le on 17/04/2019.
//  Copyright © 2019 Thanh-Tam Le. All rights reserved.
//

import Foundation
import Alamofire

class ArticleRouter: BaseRouter {
    
    enum APIs {
        case emailed(String)
        case shared(String)
        case viewed(String)
        case none
        
        public func create() -> ArticleRouter {
            return ArticleRouter(api: self)
        }
    }
    
    init(api: APIs) {
        self.api = api
        super.init()
    }
    
    var api: APIs
    
    override var method: HTTPMethod {
        switch self.api {
        case .emailed, .shared, .viewed:
            return .get
        default:
            return .post
        }
    }
    
    override var header: HTTPHeaders {
        return Utils.getGenericHeader()
    }
    
    override var path: String {
        switch self.api {
        case .emailed(let key):
            return "emailed/1.json?api-key=\(key)"
        case .shared(let key):
            return "shared/1/facebook.json?api-key=\(key)"
        case .viewed(let key):
            return "viewed/7.json?api-key=\(key)"
        default:
            return ""
        }
    }
    
    override func finalRequest() throws -> URLRequest {
        let url = try baseURLString.asURL()
        var urlRequest = URLRequest(url: URL.init(string: "\(url.absoluteString)\(path)")!)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = header
        switch self.api {
        default:
            urlRequest = try URLEncoding.default.encode(urlRequest, with: nil)
        }
        urlRequest.timeoutInterval = TimeInterval(CONNECTION_TIMEOUT)
        return urlRequest
    }
    
    override func parseResponse(_ json: [String : Any]?) -> BaseResponse {
        var model = super.parseResponse(json)
        do {
            model = try decodeData(json, model)
        } catch {
            DebugMode.printLog(forMessage: error.localizedDescription)
        }
        return model
    }
}

extension ArticleRouter {
    
    func decodeData(_ json: [String: Any]?, _ model: BaseResponse) throws -> BaseResponse {
        guard let jsonData = json?["data"] as? [String : Any] else {
            return model
        }
        let data = try JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted)
        switch self.api {
        case .emailed:
            model.data = try JSONDecoder().decode(EmailedArticle.self, from: data)
        return model
        case .shared(_):
            model.data = try JSONDecoder().decode(EmailedArticle.self, from: data)
        case .viewed(_):
            model.data = try JSONDecoder().decode(EmailedArticle.self, from: data)
        default:
            model.data = nil
        }
        return model
    }
}
