//
//  AppTheme.swift
//  SNY
//
//  Created by Thanh-Tam Le on 13/04/2019.
//  Copyright © 2019 Thanh-Tam Le. All rights reserved.
//

import UIKit

class AppTheme {
    
    class var statusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    class var primaryColor: UIColor {
        return #colorLiteral(red: 0.2431372549, green: 0.4862745098, blue: 0.9529411765, alpha: 1)
    }
    
    class var accentColor: UIColor {
        return .white
    }
    
    class var font: Font {
        return Font.roboto
    }
}


// MARK: - View
extension AppTheme {
    
    class var viewPrimaryBackgroundColor: UIColor {
        return AppTheme.primaryColor
    }
    
    class var viewSecondaryBackgroundColor: UIColor {
        return .white
    }
    
    class var viewShadowColor: UIColor {
        return UIColor.black.withAlphaComponent(0.2)
    }
    
    class var lineColor: UIColor {
        return #colorLiteral(red: 0.8784313725, green: 0.8784313725, blue: 0.8784313725, alpha: 1)
    }
}


// MARK: - Label
extension AppTheme {
    
    class var labelPrimaryColor: UIColor {
        return #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    }
    
    class var labelSecondaryColor: UIColor {
        return #colorLiteral(red: 0.6039215686, green: 0.631372549, blue: 0.7058823529, alpha: 1)
    }
    
    class var labelNeutralColor: UIColor {
        return #colorLiteral(red: 0.5176470588, green: 0.5333333333, blue: 0.5725490196, alpha: 1)
    }
    
    class var labelNegativeColor: UIColor {
        return #colorLiteral(red: 1, green: 0, blue: 0.3921568627, alpha: 1)
    }
}


// MARK: - Button
extension AppTheme {
    
    class var buttonMainColor: UIColor {
        return #colorLiteral(red: 0.2431372549, green: 0.4862745098, blue: 0.9529411765, alpha: 1)
    }
    
    class var imageButtonActive: UIColor {
        return #colorLiteral(red: 1, green: 0, blue: 0.3921568627, alpha: 1)
    }
    
    class var imageButtonInactive: UIColor {
        return #colorLiteral(red: 0.5176470588, green: 0.5333333333, blue: 0.5725490196, alpha: 1)
    }
}

// MARK: - Tabbar
extension AppTheme {
    
    class var tabBarBackgroundColor: UIColor {
        return #colorLiteral(red: 0.09411764706, green: 0.09411764706, blue: 0.1529411765, alpha: 1)
    }
}
