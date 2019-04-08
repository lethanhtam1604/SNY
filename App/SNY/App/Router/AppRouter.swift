//
//  Router.swift
//  SNY
//
//  Created by Thanh-Tam Le on 15/11/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import UIKit

/// RouterType represent the type of router
/// In conjunction with Router for handling the flow of whole app appropriately
///
/// - mainController: MainController
/// - authentication: AuthenticationController
enum RouterType {
    
    case mainController
    case authentication
}

// MARK: - Router
// All flow controller will be defined here
class AppRouter {
    
    // MARK: - Variables
    
    // MARK: - Init
    init() {
        
    }
    
    // MARK: - Public
    func initMainWindow() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = handleRouter(type: .mainController)
        window.makeKeyAndVisible()
        return window
    }
}

// MARK: - Private
extension AppRouter {
    
    /// Defind the core of router
    ///
    /// - Parameter type: RouterType's instance
    /// - Returns: Desised controller
    private func handleRouter(type: RouterType) -> UIViewController {
        switch type {
        case .mainController:
            
            // Get from XIB
            let controller = UINavigationController(rootViewController: LandingVC())
            
            return controller
            
        default: // Didn't support yet
            return UIViewController()
        }
    }
}
