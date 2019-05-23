//
//  SessionManager+Extension.swift
//  SNY
//
//  Created by Thanh-Tam Le on 17/04/2019.
//  Copyright © 2019 Thanh-Tam Le. All rights reserved.
//

import UIKit
import Alamofire

extension SessionManager {
    
    private struct AssociatedKeys {
        static var ignoringAPIKey = "URLSession.ServerTrustPolicyManager.IgnoringAPIKey"
    }
    
    var isIgnoringAPI: Bool {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.ignoringAPIKey) as? Bool ?? false
        }
        set (newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.ignoringAPIKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
