//
//  NewFeedViewModel.swift
//  SNY
//
//  Created by Thanh-Tam Le on 15/11/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import UIKit

protocol NewFeedViewModelProtocol: class {
    
    init(newFeed: NewFeed)
    
    func getThumbnailURL() -> String?
    func getImageURL() -> String?
    func getTitle() -> String?
    func getDetail() -> String?
    func getDateTime() -> String?
    func setReload(_ value: Bool)
    func isReload() -> Bool
}

class NewFeedViewModel: NewFeedViewModelProtocol {
    
    // MARK: - Variables
    private var newFeed: NewFeed?
    
    // Closure
    var updatingGrayedOutColor: (()->())?
    
    // MARK: - Inititalization
    required init(newFeed: NewFeed) {
        self.newFeed = newFeed
    }
    
    func getThumbnailURL() -> String? {
        return newFeed?.thumbnailUrl
    }
    
    func getImageURL() -> String? {
        return newFeed?.imageURL
    }
    
    func getTitle() -> String? {
        return newFeed?.title
    }
    
    func getDetail() -> String? {
        return newFeed?.detail
    }
    
    func getDateTime() -> String? {
        return newFeed?.dateTime
    }
    
    func setReload(_ value: Bool) {
        newFeed?.reload = value
    }
    
    func isReload() -> Bool {
        return newFeed?.reload ?? false
    }
}
