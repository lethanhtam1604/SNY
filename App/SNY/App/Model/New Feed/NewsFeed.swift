//
//  NewsFeed.swift
//  SNY
//
//  Created by Thanh-Tam Le on 15/11/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import UIKit

struct NewsFeed {
    
    // MARK: - Variables
    var id: Int?
    var thumbnailUrl : String?
    var photo        : NewsFeedPhoto?
    var title        : String?
    var detail       : String?
    var dateTime     : String?
    
    // MARK: - Initializations
    init(id: Int? = nil, thumbnailUrl: String? = nil, photo: NewsFeedPhoto? = nil, title: String? = nil, detail: String? = nil, dateTime: String? = nil) {
        self.id           = id
        self.thumbnailUrl = thumbnailUrl
        self.photo        = photo
        self.title        = title
        self.detail       = detail
        self.dateTime     = dateTime
    }
}
