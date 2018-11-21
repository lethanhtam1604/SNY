//
//  MessageRightCell.swift
//  SNY
//
//  Created by Thanh-Tam Le on 23/10/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import UIKit

class MessageRightCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var containView: UIView!
    @IBOutlet private weak var contentLabel: UILabel!
    
    // MARK: - Variables
    static let identifier = "MessageRightCell"
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
extension MessageRightCell {
    
    private func initCommon() {
        containView.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        containView.layer.cornerRadius = 10
        
        contentLabel.textColor = .white
    }
}
