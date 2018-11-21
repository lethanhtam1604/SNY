//
//  BaseVC.swift
//  SNY
//
//  Created by Thanh-Tam Le on 14/10/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import UIKit

class BaseVC: CustomVC {
    
    // MARK: - Outlets
    
    // MARK: - Variables
    
    // MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCommon()
        setupNavigationBar()
    }
    
    // MARK: - Memory Warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

// MARK: - Setup ViewController
extension BaseVC {
    
    private func initCommon() {
        
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.tintColor = UIColor.darkGray
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationController?.navigationBar.layer.shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 1, height: 1)
        navigationController?.navigationBar.layer.shadowRadius = 4
        navigationController?.navigationBar.layer.shadowOpacity = 0.5
        navigationController?.navigationBar.layer.masksToBounds = false
    }
}

// MARK: - Functionalities
extension BaseVC {
    
    func popVC() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func pushViewController(vc: UIViewController, withAnimation: Bool = true) {
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(vc, animated: withAnimation)
        }
    }
    
    func setBackButton() {
        let backButton = UIBarButtonItem.init(image: #imageLiteral(resourceName: "ic_left_arrow"), style: .plain, target: self, action: #selector(actionTapToBackButton))
        self.navigationItem.leftBarButtonItem = backButton
        self.navigationItem.leftBarButtonItem?.accessibilityLabel = "back"
    }
    
    @objc private func actionTapToBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
