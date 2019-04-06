//
//  NewFeed.swift
//  SNY
//
//  Created by Thanh-Tam Le on 15/11/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import UIKit

struct NewFeed {
    
    // MARK: - Variables
    var id: Int?
    var thumbnailUrl: String?
    var imageURL: String?
    var title: String?
    var detail: String?
    var dateTime: String?
    var reload: Bool?
    
    // MARK: - Initializations
    init(id: Int? = nil, thumbnailUrl: String? = nil, imageURL: String? = nil, title: String? = nil, detail: String? = nil, dateTime: String? = nil, reload: Bool? = false) {
        self.id = id
        self.thumbnailUrl = thumbnailUrl
        self.imageURL = imageURL
        self.title = title
        self.detail = detail
        self.dateTime = dateTime
        self.reload = reload
    }
}
