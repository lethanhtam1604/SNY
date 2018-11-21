//
//  Utils.swift
//  SNY
//
//  Created by Thanh-Tam Le on 31/10/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import Foundation
import Alamofire

// MARK: - Structs
struct DebugMode {
    
    static func isEnabled() -> Bool {
        #if DEBUG
        return true
        #endif
        return false
    }
    
    static func printLog(forMessage message: Any...) {
        if isEnabled() {
            print("\n\n")
            print(Date().description(with: Locale.current))
            print(message)
            print("\n\n")
        }
    }
}


class Utils {
    
    //MARK: - Headers
    class func getGenericHeader() -> HTTPHeaders {
        let header = ["Content-Type": "application/json"]
        return header
    }
}

