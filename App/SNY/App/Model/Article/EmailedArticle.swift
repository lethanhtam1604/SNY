//
//  EmailedArticle.swift
//  SNY
//
//  Created by Thanh-Tam Le on 17/04/2019.
//  Copyright © 2019 Thanh-Tam Le. All rights reserved.
//

import UIKit

class EmailedArticle: Codable {
    
    var abstract: String?
    var adx_keywords: String?
    
    enum CodingKeys: String, CodingKey {
        
        case abstract
        case adx_keywords
    }
}
