//
//  CustomSessionDelegate.swift
//  SNY
//
//  Created by Thanh-Tam Le on 17/04/2019.
//  Copyright © 2019 Thanh-Tam Le. All rights reserved.
//

import UIKit
import Alamofire

class CustomSessionDelegate: SessionDelegate {
    
    override init() {
        super.init()
        
        sessionDidReceiveChallengeWithCompletion = { session, challenge, completion in
            guard let trust = challenge.protectionSpace.serverTrust, SecTrustGetCertificateCount(trust) > 0 else {
                // This case will probably get handled by ATS, but still...
                completion(.cancelAuthenticationChallenge, nil)
                return
            }
            
            if let serverCertificate = SecTrustGetCertificateAtIndex(trust, 0) {
                let serverCertificateData = SecCertificateCopyData(serverCertificate) as Data
                
                if CustomSessionDelegate.pinnedCertificates().contains(serverCertificateData) {
                    completion(.useCredential, URLCredential(trust: trust))
                    return
                }
            }
            
            if let serverCertificate = SecTrustGetCertificateAtIndex(trust, 0), let serverCertificateKey = CustomSessionDelegate.publicKey(for: serverCertificate) {
                if CustomSessionDelegate.pinnedKeys().contains(serverCertificateKey) {
                    completion(.useCredential, URLCredential(trust: trust))
                    return
                }
            }
            
            completion(.cancelAuthenticationChallenge, nil)
        }
    }
    
    private static func pinnedCertificates() -> [Data] {
        var certificates: [Data] = []
        
        let cerName = "prod"
        
        if let pinnedCertificateURL = Bundle.main.url(forResource: cerName, withExtension: "cer") {
            do {
                let pinnedCertificateData = try Data(contentsOf: pinnedCertificateURL)
                certificates.append(pinnedCertificateData)
            } catch (_) {
                // Handle error
            }
        }
        
        return certificates
    }
    
    private static func pinnedKeys() -> [SecKey] {
        var publicKeys: [SecKey] = []
        
        let cerName = "prod"
        
        if let pinnedCertificateURL = Bundle.main.url(forResource: cerName, withExtension: "cer") {
            do {
                let pinnedCertificateData = try Data(contentsOf: pinnedCertificateURL) as CFData
                if let pinnedCertificate = SecCertificateCreateWithData(nil, pinnedCertificateData), let key = publicKey(for: pinnedCertificate) {
                    publicKeys.append(key)
                }
            } catch (_) {
                // Handle error
            }
        }
        
        return publicKeys
    }
    
    // Implementation from Alamofire
    private static func publicKey(for certificate: SecCertificate) -> SecKey? {
        var publicKey: SecKey?
        
        let policy = SecPolicyCreateBasicX509()
        var trust: SecTrust?
        let trustCreationStatus = SecTrustCreateWithCertificates(certificate, policy, &trust)
        
        if let trust = trust, trustCreationStatus == errSecSuccess {
            publicKey = SecTrustCopyPublicKey(trust)
        }
        
        return publicKey
    }
    
}
