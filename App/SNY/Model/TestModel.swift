//
//  TestModel.swift
//  SNY
//
//  Created by Thanh-Tam Le on 31/10/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import Foundation

class TestModel: Codable {
    
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        
        case url
    }
}
