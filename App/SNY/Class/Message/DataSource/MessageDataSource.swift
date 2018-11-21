//
//  MessageDataSource.swift
//  SNY
//
//  Created by Thanh-Tam Le on 23/10/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import UIKit

// MARK: - MessageDataSource
class MessageDataSource: NSObject {

    // MARK: - Variables
    private var data: [MessageViewModel] = []
    
    // MARK: - Init
    override init() {
        
    }
    
    public func append(_ newMessages: [MessageViewModel]) {
        data.append(contentsOf: newMessages)
    }
}

// MARK: - UITableViewDataSource
extension MessageDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = data[indexPath.row]
        if item.isIncoming ?? false {
            let cell = tableView.dequeueReusableCell(withIdentifier: MessageLeftCell.identifier, for: indexPath) as! MessageLeftCell
            cell.messageViewModel = item
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: MessageRightCell.identifier, for: indexPath) as! MessageRightCell
            cell.messageViewModel = item
            return cell
        }
    }
}

// MARK: - UITableViewDelegate
extension MessageDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
