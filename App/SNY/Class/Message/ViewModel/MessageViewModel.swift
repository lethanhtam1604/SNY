//
//  MessageViewModel.swift
//  SNY
//
//  Created by Thanh-Tam Le on 23/10/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import Foundation

class MessageViewModel: NSObject {
    
    // MARK: - Variables
    var content: String?
    var date: String?
    var isIncoming: Bool?
    
    // MARK: - Inititalization
    init(item: ChatMessage) {
        content = item.content
        date = item.date
        isIncoming = item.isIncoming
    }
}
