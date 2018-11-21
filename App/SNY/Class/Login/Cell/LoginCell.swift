//
//  LoginCell.swift
//  SNY
//
//  Created by Thanh-Tam Le on 14/10/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import UIKit

class LoginCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var userNameLabel: UILabel!
    
    // MARK: - Variables
    static let identifier = "LoginCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    
        initCommon()
    }
    
    // MARK: - Binding Data
    func bindingData(_ user: User) {
        userNameLabel.text = user.userName
    }
}

// MARK: - Setup Cell
extension LoginCell {
    
    private func initCommon() {
        
    }
}
