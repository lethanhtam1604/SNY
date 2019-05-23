//
//  BaseRouter.swift
//  SNY
//
//  Created by Thanh-Tam Le on 17/04/2019.
//  Copyright © 2019 Thanh-Tam Le. All rights reserved.
//

import Foundation
import Alamofire

class BaseRouter: URLRequestConvertible {

    let baseURLString = BASEURL
    
    // MARK: - HTTP Methods
    var method: HTTPMethod {
        return .post
    }
    
    // MARK: - HTTP Headers
    var header: HTTPHeaders {
        return Utils.getGenericHeader()
    }
    
    // MARK: - HTTP for download
    var isForDownloadImage: Bool {
        return false
    }
    
    // MARK: - HTTP Paths
    var path: String {
        return ""
    }
    
    // MARK: - Method URL Request
    func asURLRequest() throws -> URLRequest {
        return try self.finalRequest()
    }
    
    
    // MARK: - Ignore SSL Pinning for some APIs
    func ignoreSSL() -> Bool {
        return true
    }
    
    // MARK: - Custom Definitions
    func finalRequest() throws -> URLRequest {
        let url = try baseURLString.asURL()
        var urlRequest : URLRequest!
        urlRequest = URLRequest(url: URL.init(string: "\(url.absoluteString)\(path)")!)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = header
        urlRequest.timeoutInterval = TimeInterval(CONNECTION_TIMEOUT)
        return urlRequest
    }
    
    // MARK: - Response Handling
    func parseResponse(_ json: [String: Any]?) -> BaseResponse {
        let model = BaseResponse()
        model.responseMessage = json?["responseMessage"] as? String
        model.responseCode = json?["responseCode"] as? String
        model.errorLog = json?["errorLog"] as? String
        return model
    }
}
