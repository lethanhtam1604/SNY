//
//  NewsFeedDataSource.swift
//  SNY
//
//  Created by Thanh-Tam Le on 15/11/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import UIKit

// MARK: - MainDataSource
class NewsFeedDataSource: NSObject {
    
    // MARK: - Variables
    private var mainNewsFeedViewModel : MainNewsFeedViewModel!
    private weak var vcSelf           : NewsFeedVC?
    private var reloadTableView = true
    
    // MARK: - Initialization
    init(vcSelf: NewsFeedVC?, mainNewsFeedViewModel: MainNewsFeedViewModel) {
        self.vcSelf                = vcSelf
        self.mainNewsFeedViewModel = mainNewsFeedViewModel
    }
}

// MARK: - UITableViewDataSource
extension NewsFeedDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainNewsFeedViewModel.numberOfNewsFeed()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: NewsFeedCell.identifier, for: indexPath) as? NewsFeedCell {
            cell.selectionStyle    = .none
            let item               = mainNewsFeedViewModel.getNewsFeedViewModel(indexPath.row)
            item.updatingContentHeight = {
                tableView.beginUpdates()
                tableView.reloadRows(at: [indexPath], with: .fade)
                tableView.endUpdates()
            }
            cell.newsFeedViewModel = item
            return cell
        }
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension NewsFeedDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let cell = tableView.dequeueReusableCell(withIdentifier: NewsFeedCell.identifier) as? NewsFeedCell {
            let newsFeedViewModel = mainNewsFeedViewModel.getNewsFeedViewModel(indexPath.row)
            return cell.heightOfCell(newsFeedViewModel)
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
