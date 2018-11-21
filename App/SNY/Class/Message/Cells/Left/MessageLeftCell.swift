//
//  MessageLeftCell.swift
//  SNY
//
//  Created by Thanh-Tam Le on 23/10/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import UIKit

class MessageLeftCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet private weak var containView: UIView!
    @IBOutlet private weak var contentLabel: UILabel!
    
    // MARK: - Variables
    static let identifier = "MessageLeftCell"
    var messageViewModel: MessageViewModel? {
        didSet {
            contentLabel.text = messageViewModel?.content
        }
    }
    
    // MARK: - View Cycle
    override func awakeFromNib() {
        super.awakeFromNib()

        initCommon()
    }
}

// MARK: - Setup Cell
extension MessageLeftCell {
    
    private func initCommon() {
        containView.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        containView.layer.cornerRadius = 10
    }
}
