//
//  CustomVC.swift
//  SNY
//
//  Created by Thanh-Tam Le on 31/10/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import UIKit

class CustomVC: UIViewController {
    
    deinit {
        print("\n\n**********************\n")
        print("all resources removed for \((self.nibName ?? self.description))")
        print("\n**************************\n\n")
    }

    /// Recommend that overriding #safeAreaValueDidChange function before getting this value
    var topSafeArea: CGFloat = 0
    /// Recommend that overriding #safeAreaValueDidChange function before getting this value
    var bottomSafeArea: CGFloat = 0
    
    // MARK: - View Cycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        let components = NSStringFromClass(type(of: self)).components(separatedBy: ".")
        super.init(nibName: nibNameOrNil ?? (components.last ?? ""), bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Cycle
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setSafeAreaValue()
    }
    
    private func setSafeAreaValue() {
        var top: CGFloat = 0
        var bottom: CGFloat = 0
        
        if #available(iOS 11.0, *) {
            top = view.safeAreaInsets.top
            bottom = view.safeAreaInsets.bottom
        } else {
            top = topLayoutGuide.length
            bottom = bottomLayoutGuide.length
        }
        if top != topSafeArea || bottom != bottomSafeArea {
            topSafeArea = top
            bottomSafeArea = bottom
            safeAreaValueDidChange()
        }
    }
    
    func safeAreaValueDidChange() {
        // Empty function, just for overriding
    }
}
