//
//  NewFeedDataSource.swift
//  SNY
//
//  Created by Thanh-Tam Le on 15/11/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import UIKit

// MARK: - MainDataSource
class NewFeedDataSource: NSObject {
    
    // MARK: - Variables
    private var mainNewFeedViewModel: MainNewFeedViewModel!
    private weak var vcSelf: NewFeedVC?
    private var reloadTableView = true
    
    // MARK: - Initialization
    init(vcSelf: NewFeedVC?, mainNewFeedViewModel: MainNewFeedViewModel) {
        self.vcSelf = vcSelf
        self.mainNewFeedViewModel = mainNewFeedViewModel
    }
}

// MARK: - UITableViewDataSource
extension NewFeedDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainNewFeedViewModel.numberOfNewFeed()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: NewFeedCell.identifier, for: indexPath) as? NewFeedCell {
            cell.selectionStyle = .none
            let item = mainNewFeedViewModel.getNewFeedViewModel(indexPath.row)
            cell.bindingData(newFeedViewModel: item) {
                if !item.isReload() {
                    item.setReload(true)
                    UIView.performWithoutAnimation {
                        tableView.beginUpdates()
                        tableView.endUpdates()
                    }
//                    tableView.reloadRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .right)
                }
            }
            cell.layoutIfNeeded()
            return cell
        }
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension NewFeedDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
