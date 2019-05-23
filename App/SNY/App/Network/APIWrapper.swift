//
//  APIWrapper.swift
//  SNY
//
//  Created by Thanh-Tam Le on 31/10/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import Foundation
import Alamofire

class APIWrapper {
    
    // MARK: - Initializers
    static private var this = APIWrapper()
    static private var network = Network()

    private init() { }
    
    // MARK: - Private API
    private class func handleGenericResponse(response: DataResponse<Any>, loader: Bool = false, _ request: BaseRouter, completion: @escaping (_ data: Codable?, _ error: String?) -> ()) {
        DebugMode.printLog(forMessage: "\nREQUEST: ", response.request?.url ?? "<EMPTY>")
        
        if loader {
            // Doing stuff here
        }
        if response.error != nil && (response.error! as NSError).code == -999 {
            return
        }
        if response.error != nil && (response.error! as NSError).code == -1001 {
            completion(nil, "Error timeout")
            return
        }
        
        if (response.response?.statusCode == 404) {
            // Doing stuff here if the app is under construction
        } else if (response.response?.statusCode == 401 || response.response?.statusCode == 403) {
            // Doing stuff here for other error based on server
        } else {
            do {
                let json = try JSONSerialization.jsonObject(with: response.data!) as! [String: Any]
                DebugMode.printLog(forMessage: "\nRESPONSEVALUE: ", json)
                let jsonResponse = request.parseResponse(json)
                completion(jsonResponse.data, jsonResponse.errorLog)
            } catch {
                NotificationCenter.default.post(name: Notification.Name("ApiTimeoutFailure"), object: nil)
            }
        }
    }
}

// MARK: - Internal Functionalities
extension APIWrapper {
    
    internal class func performAPICall(loader: Bool = false, _ request: BaseRouter, completion: @escaping (_ data: Codable?, _ error: String?) -> ()) -> DataRequest? {
        
        if loader {
            // Doing stuff here
        }
        
        if request.isForDownloadImage {
            let dataRequest = APIWrapper.network.callGlobalAPI(apiRequest: request)
            dataRequest.responseData { (response) in
                if loader {
                    // Doing stuff here
                }
                completion(response.value, nil)
            }
            return dataRequest
        }
        
        return APIWrapper.network.callGlobalAPI(apiRequest: request).responseJSON { (response) in
            self.handleGenericResponse(response: response, loader: loader, request, completion: completion)
        }
    }
}
