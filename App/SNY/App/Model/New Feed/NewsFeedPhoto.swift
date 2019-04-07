//
//  NewsFeedPhoto.swift
//  SNY
//
//  Created by Thanh-Tam Le on 06/04/2019.
//  Copyright © 2019 Thanh-Tam Le. All rights reserved.
//

import UIKit

struct NewsFeedPhoto {
  
    // MARK: - Variables
    var imageURL : String?
    var width    : Double?
    var height   : Double?

    // MARK: - Initializations
    init(imageURL: String? = nil, width: Double? = nil, height: Double? = nil) {
        self.imageURL = imageURL
        self.width    = width
        self.height   = height
    }
}
