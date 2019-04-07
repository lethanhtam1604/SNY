//
//  NewsFeedViewModel.swift
//  SNY
//
//  Created by Thanh-Tam Le on 15/11/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import UIKit

protocol NewsFeedViewModelProtocol: class {
    
    init(newsFeed: NewsFeed)
    
    func getThumbnailURL() -> String?
    func getPhotoViewModel() -> NewsFeedPhotoViewModel
    func getTitle() -> String?
    func getDetail() -> String?
    func getDateTime() -> String?
}

class NewsFeedViewModel: NewsFeedViewModelProtocol {
    
    // MARK: - Variables
    private var newsFeed: NewsFeed?
    
    // Closure
    var updatingContentHeight: (()->())?
    
    // MARK: - Inititalization
    required init(newsFeed: NewsFeed) {
        self.newsFeed = newsFeed
    }
    
    func getThumbnailURL() -> String? {
        return newsFeed?.thumbnailUrl
    }
    
    func getPhotoViewModel() -> NewsFeedPhotoViewModel {
        return NewsFeedPhotoViewModel(newsFeedPhoto: newsFeed?.photo)
    }
    
    func getTitle() -> String? {
        return newsFeed?.title
    }
    
    func getDetail() -> String? {
        return newsFeed?.detail
    }
    
    func getDateTime() -> String? {
        return newsFeed?.dateTime
    }
    
    func reloadContent() {
        updatingContentHeight?()
    }
}
