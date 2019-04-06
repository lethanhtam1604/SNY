//
//  UserDefaultHelper.swift
//  SNY
//
//  Created by Thanh-Tam Le on 31/10/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import Foundation

class UserDefaultHelper {
    
    
    // MARK: - UserDefaults
    private static let defaults = UserDefaults.standard
    
    // MARK: - Keys
    private static let accessTokenKey                   = "accessToken"
   
    
    // MARK: - User Default method
    private static func saveUserDefaults(value: Any?, key: String, shouldAsync: Bool = true) {
        if value != nil {
            if shouldAsync {
                DispatchQueue.main.async {
                    saveDefault(value: value, key: key)
                }
            } else {
                saveDefault(value: value, key: key)
            }
        }
    }
    
    private static func saveDefault(value: Any?, key: String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    private static func removeAllCache() {
        removeUserDefault(accessTokenKey)
    }
    
    static func removeUserDefault(_ key: String) {
        defaults.removeObject(forKey: key)
    }

    
    // MARK: - Init
    private init() { }
    
    static func checkAndExecuteSettings() {
        if defaults.bool(forKey: "resetcache") {
            saveUserDefaults(value: false, key: "resetcache", shouldAsync: false)
            removeAllUserDefaults()
        }
    }
    
    static func removeAllUserDefaults() {
        removeAllCache()
    }

    static func saveAccessToken(string: String) {
        saveUserDefaults(value: string, key: accessTokenKey)
    }
    
    static func getAccessToken() -> String {
        return defaults.value(forKey: accessTokenKey) as? String ?? ""
    }
}
