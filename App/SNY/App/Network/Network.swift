//
//  Network.swift
//  SNY
//
//  Created by Thanh-Tam Le on 17/04/2019.
//  Copyright © 2019 Thanh-Tam Le. All rights reserved.
//

import UIKit
import Alamofire

class Network {
    
    // MARK: - Variables
    private var sessionManager : SessionManager?
    private var apiRequest     : URLRequestConvertible!
    
    // MARK: - Private Functionalites
    private let prodPolicies: [String: ServerTrustPolicy] = [
        "m.hongleongconnect.my": .pinCertificates(
            certificates: ServerTrustPolicy.certificates(in: Bundle.main),
            validateCertificateChain: true,
            validateHost: true
        )
    ]
    
    private func getSessionManagerWithSSLPinningEnabled(forConfig configuration: URLSessionConfiguration) -> SessionManager {
        return Alamofire.SessionManager.init(configuration: configuration, delegate: CustomSessionDelegate(), serverTrustPolicyManager: CustomServerTrustPolicyManager(policies: prodPolicies)
        )
    }
    
    private func getSessionManagerWithSSLPinningDisabled(forConfig configuration: URLSessionConfiguration) -> SessionManager {
        return Alamofire.SessionManager.init(configuration: configuration, serverTrustPolicyManager: CustomServerUnTrustPoliceManager())
    }
    
    private func resolveChallengeWhenSSLDisabled() {
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
    
    private func getSessionManager(_ isForIgnoredSSLPinning: Bool = true) -> SessionManager {
        if sessionManager == nil {
            let configuration = URLSessionConfiguration.default
            configuration.httpMaximumConnectionsPerHost = 4
            configuration.allowsCellularAccess = true
            configuration.timeoutIntervalForRequest = TimeInterval(CONNECTION_TIMEOUT)
            
            if isForIgnoredSSLPinning {
                sessionManager = getSessionManagerWithSSLPinningDisabled(forConfig: configuration)
            } else {
                sessionManager = getSessionManagerWithSSLPinningEnabled(forConfig: configuration)
            }
            sessionManager?.isIgnoringAPI = isForIgnoredSSLPinning
            resolveChallengeWhenSSLDisabled()
        }
        
        return sessionManager!
    }
    
    // MARK: - Internal Functionalites
    internal func callGlobalAPI(apiRequest: URLRequestConvertible!) -> DataRequest {
        return getSessionManager().request(apiRequest)
    }
}
