//
//  APIWrapper.swift
//  SNY
//
//  Created by Thanh-Tam Le on 31/10/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import Foundation
import Alamofire

private class Network {
    
    private var sessionManager: SessionManager?
    private var apiRequest: URLRequestConvertible!

    private func getSessionManager() -> SessionManager {
        if sessionManager == nil {
            let configuration = URLSessionConfiguration.default
            configuration.httpMaximumConnectionsPerHost = 4
            configuration.allowsCellularAccess = true
            configuration.timeoutIntervalForRequest = TimeInterval(CONNECTION_TIMEOUT)
            
            sessionManager = Alamofire.SessionManager.init(configuration: configuration, serverTrustPolicyManager: CServerTrustPoliceManager())
            sessionManager?.delegate.sessionDidReceiveChallenge = { session, challenge in
                var disposition: URLSession.AuthChallengeDisposition = .performDefaultHandling
                var credential: URLCredential?
                if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
                    disposition = .useCredential
                    credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
                } else {
                    if challenge.previousFailureCount > 0 {
                        disposition = .cancelAuthenticationChallenge
                    } else {
                        credential = self.sessionManager?.session.configuration.urlCredentialStorage?.defaultCredential(for: challenge.protectionSpace)
                        if credential != nil {
                            disposition = .useCredential
                        }
                    }
                }
                DebugMode.printLog(forMessage: "RECEIVED CHALLENGE", "RESOLVING>>")
                return (disposition, credential)
            }
        }
        
        return sessionManager!
    }
    
    private class CServerTrustPoliceManager : ServerTrustPolicyManager {
        
        override func serverTrustPolicy(forHost host: String) -> ServerTrustPolicy? {
            return .disableEvaluation
        }
        
        public init() {
            super.init(policies: [:])
        }
    }
    
    fileprivate func callGlobalAPI(apiRequest: URLRequestConvertible!) -> DataRequest {
        return getSessionManager().request(apiRequest)
    }
}


class APIWrapper {
    
    // MARK: - Initializers
    static private var this = APIWrapper()
    static private var network = Network()

    private init() { }
    
    // MARK: - Private API
    private func handleGenericResponse(response: DataResponse<Any>, loader: Bool = false, _ request: Router, completion: @escaping (_ data: Codable?, _ error: String?) -> ()) {
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
                let jsonResponse = JSONResponse.init(json: json, apiType: request.path)
               
                var error = jsonResponse.responseCode != "0000" ? (jsonResponse.responseMessage ?? "Something wrong") : nil
                if error == "Success" {
                    error = nil
                }
                if error != nil {
                    jsonResponse.data = nil
                }
                completion(jsonResponse.data, error)
            } catch {
                NotificationCenter.default.post(name: Notification.Name("ApiTimeoutFailure"), object: nil)
            }
        }
    }
    
    private func performAPICall(loader:Bool = false, _ request: Router, completion: @escaping (_ data: Codable?, _ error: String?) -> ()) -> DataRequest? {
        
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
    
    
    // MARK: - Promotion Resource
    @discardableResult
    static func getPromotions(loader: Bool = false, _ completion: @escaping (_ data: TestModel?, _ error: String?)->()) -> DataRequest? {
        return this.performAPICall(loader: loader, .getPromotion) { (model, error) in
            completion(model as? TestModel, error)
        }
    }
    
    // MARK: - Image
    @discardableResult
    static func downloadImageData(urlString: String, _ completion: @escaping (_ data: Data?, _ error: String?)->()) -> DataRequest? {
        if urlString.isEmpty {
            completion(nil, nil)
            return nil
        }
        return this.performAPICall(.downloadImages(urlString)) { (data, error) in
            completion(data as? Data, error)
        }
    }
    
}
