//
//  Router.swift
//  SNY
//
//  Created by Thanh-Tam Le on 30/10/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import UIKit
import Alamofire

enum Router: URLRequestConvertible {
    
    // MARK: - Promotion Resource
    case getPromotion
    
    // MARK: - Download Images
    case downloadImages(String?)

    // MARK: - HTTP URLs
    static let baseURLString = BASEURL
    
    // MARK: - HTTP Methods
    var method: HTTPMethod {
        switch self {
        case .getPromotion, .downloadImages:
            return .get
        default:
            return .post
        }
    }
    
    // MARK: - HTTP Headers
    var header: HTTPHeaders {
        switch self {
        case .getPromotion:
            return Utils.getGenericHeader()
        case .downloadImages:
            return [:]
        default:
            return [:]
        }
    }
    
    var isForDownloadImage: Bool {
        switch self {
        case .downloadImages:
            return true
        default:
            return false
        }
    }
    
    // MARK: - HTTP Paths
    var path: String {
        switch self {
            
        // MARK: - PATH - Promotion Resource
        case .getPromotion:
            return GET_PROMOTION

        // MARK: - PATH - Downlod Images
        case .downloadImages(let param):
            return param ?? ""
            
        }
    }
    
    // MARK: - Method URL Request
    func asURLRequest() throws -> URLRequest {
        return try self.finalRequest()
    }
    
    // MARK: - Custom Definitions
    func finalRequest() throws -> URLRequest {
        let url = try Router.baseURLString.asURL()
        var urlRequest : URLRequest!
        if self.isForDownloadImage {
            urlRequest = URLRequest(url: URL.init(string: path)!)
            urlRequest.httpMethod = method.rawValue
            urlRequest.allHTTPHeaderFields = header
            return urlRequest
        }
        urlRequest = URLRequest(url: URL.init(string: "\(url.absoluteString)\(path)")!)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = header
        
        switch self {
        //case .getPromotion(let param):
            //urlRequest = try JSONEncoding.default.encode(urlRequest, with: param)
        default:
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: nil)
        }
        
        return urlRequest
    }
}
