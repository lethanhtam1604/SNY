//
//  Font.swift
//  SNY
//
//  Created by Thanh-Tam Le on 13/04/2019.
//  Copyright © 2019 Thanh-Tam Le. All rights reserved.
//

import UIKit

enum Font {
    
    case roboto
    
    func regular(ofSize size: CGFloat) -> UIFont {
        
        var font: UIFont?
        
        switch self {
        case .roboto:
            font = UIFont(name: "Roboto-Regular", size: size)
        }
        
        return font ?? UIFont.systemFont(ofSize: size)
    }
    
    func medium(ofSize size: CGFloat) -> UIFont {
        
        var font: UIFont?
        
        switch self {
        case .roboto:
            font = UIFont(name: "Roboto-Medium", size: size)
        }
        
        return font ?? UIFont.systemFont(ofSize: size)
    }
    
    func light(ofSize size: CGFloat) -> UIFont {
        
        var font: UIFont?
        
        switch self {
        case .roboto:
            font = UIFont(name: "Roboto-Light", size: size)
        }
        
        return font ?? UIFont.systemFont(ofSize: size)
    }
    
    func bold(ofSize size: CGFloat) -> UIFont {
        
        var font: UIFont?
        
        switch self {
        case .roboto:
            font = UIFont(name: "Roboto-Bold", size: size)
        }
        
        return font ?? UIFont.systemFont(ofSize: size)
    }
    
    func italic(ofSize size: CGFloat) -> UIFont {
        
        var font: UIFont?
        
        switch self {
        case .roboto:
            font = UIFont(name: "Roboto-Italic", size: size)
        }
        
        return font ?? UIFont.systemFont(ofSize: size)
    }
    
    func weight(_ weight: UIFont.Weight, ofSize size: CGFloat) -> UIFont {
        switch weight {
        case .medium:
            return medium(ofSize: size)
        case .light:
            return light(ofSize: size)
        case .bold:
            return bold(ofSize: size)
        default:
            return regular(ofSize: size)
        }
    }
    
    func transform(font: UIFont, ofSize size: CGFloat) -> UIFont {
        if font.isItalic {
            return italic(ofSize: size)
        }
        return weight(font.weight, ofSize: size)
    }
}

extension UIFont {
    
    var weight: UIFont.Weight {
        guard let weightNumber = traits[.weight] as? NSNumber else { return .regular }
        let weightRawValue = CGFloat(weightNumber.doubleValue)
        let weight = UIFont.Weight(rawValue: weightRawValue)
        return weight
    }
    
    private var traits: [UIFontDescriptor.TraitKey: Any] {
        return fontDescriptor.object(forKey: .traits) as? [UIFontDescriptor.TraitKey: Any]
            ?? [:]
    }
    
    var isItalic: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitItalic)
    }
}
