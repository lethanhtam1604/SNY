//
//  LoginDataSource.swift
//  SNY
//
//  Created by Thanh-Tam Le on 14/10/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import UIKit

class LoginDataSource: NSObject {
    
    // MARK: - Variable
    private var data: [User] = []
    
    public func append(_ newUsers: [User]) {
        data.append(contentsOf: newUsers)
    }
}

// MARK: - UITableViewDataSource
extension LoginDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: LoginCell.identifier, for: indexPath) as! LoginCell
        let item = data[indexPath.row]
        cell.bindingData(item)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension LoginDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
