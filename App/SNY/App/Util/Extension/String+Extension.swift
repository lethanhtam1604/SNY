//
//  String.swift
//  SNY
//
//  Created by Thanh-Tam Le on 16/11/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import UIKit

extension String {

    func heightOfString(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.height
    }
}
