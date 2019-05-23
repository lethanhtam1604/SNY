//
//  CustomServerTrustPolicyManager.swift
//  SNY
//
//  Created by Thanh-Tam Le on 17/04/2019.
//  Copyright © 2019 Thanh-Tam Le. All rights reserved.
//

import UIKit
import Alamofire

class CustomServerTrustPolicyManager: ServerTrustPolicyManager {
    
    override func serverTrustPolicy(forHost host: String) -> ServerTrustPolicy? {
        // Check if we have a policy already defined, otherwise just kill the connection
        if let policy = super.serverTrustPolicy(forHost: host) {
            DebugMode.printLog(forMessage: policy)
            return policy
        } else {
            return .customEvaluation({ (_, _) -> Bool in
                return false
            })
        }
    }
}
