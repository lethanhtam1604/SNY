//
//  MainNewFeedViewModel.swift
//  SNY
//
//  Created by Thanh-Tam Le on 15/11/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import UIKit

protocol MainNewFeedViewModelProtocol: class {
    func setupNewFeedViewModels()
    func numberOfNewFeed() -> Int
    func getNewFeedViewModel(_ index: Int) -> NewFeedViewModel
}

class MainNewFeedViewModel: MainNewFeedViewModelProtocol {
    
    // MARK: - Variables
    private var newFeedViewModels: [NewFeedViewModel] = []
    
    // MARK: - Closures
    var reloadDataForTableView: (()->())?
    
    /// MARK: - Functionalities
    func setupNewFeedViewModels() {
        
        // Creating new feed view models
        newFeedViewModels = NewFeedService.shared().getNewFeeds().map { (model) -> NewFeedViewModel in
            let newFeedViewModel = NewFeedViewModel(newFeed: model)
            return newFeedViewModel
        }
        
        // Retuning the call back to reload data for TableView
        self.reloadDataForTableView?()
    }
    
    func numberOfNewFeed() -> Int {
        return newFeedViewModels.count
    }
    
    func getNewFeedViewModel(_ index: Int) -> NewFeedViewModel {
        return newFeedViewModels[index]
    }
}

