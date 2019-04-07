//
//  MainNewsFeedViewModel.swift
//  SNY
//
//  Created by Thanh-Tam Le on 15/11/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import UIKit

protocol MainNewsFeedViewModelProtocol: class {
    func setupNewsFeedViewModels()
    func numberOfNewsFeed() -> Int
    func getNewsFeedViewModel(_ index: Int) -> NewsFeedViewModel
}

class MainNewsFeedViewModel: MainNewsFeedViewModelProtocol {
    
    // MARK: - Variables
    private var newsFeedViewModels: [NewsFeedViewModel] = []
    
    // MARK: - Closures
    var reloadDataForTableView: (()->())?
    
    /// MARK: - Functionalities
    func setupNewsFeedViewModels() {
        
        // Creating new feed view models
        newsFeedViewModels = NewsFeedHelper.shared().getNewsFeeds().map { (model) -> NewsFeedViewModel in
            let newsFeedViewModel = NewsFeedViewModel(newsFeed: model)
            return newsFeedViewModel
        }
        
        // Retuning the call back to reload data for TableView
        self.reloadDataForTableView?()
    }
    
    func numberOfNewsFeed() -> Int {
        return newsFeedViewModels.count
    }
    
    func getNewsFeedViewModel(_ index: Int) -> NewsFeedViewModel {
        return newsFeedViewModels[index]
    }
}

