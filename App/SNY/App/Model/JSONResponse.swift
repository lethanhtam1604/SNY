//
//  JSONResponse.swift
//  SNY
//
//  Created by Thanh-Tam Le on 31/10/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import Foundation

class JSONResponse {

    var data: Codable?
    var responseMessage: String?
    var responseCode: String?
    var errorLog: String?
    
    init(json: [String: Any]?, apiType: String) {
        
        if let jsonData = json?["data"] as? [String : Any] {
            do {
                switch apiType {
                case GET_PROMOTION:
                    //                    self.data = try JSONDecoder().decode(ProcessRegistrationResponseDataType.self, from: JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted))
                    self.data = nil
                default:
                    self.data = nil
                
                }
            } catch {
                DebugMode.printLog(forMessage: error)
            }
        }
        
        self.responseMessage = json?["responseMessage"] as? String
        self.responseCode = json?["responseCode"] as? String
    }
}
