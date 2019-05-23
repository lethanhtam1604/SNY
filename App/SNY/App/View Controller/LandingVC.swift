//
//  LandingVC.swift
//  SNY
//
//  Created by Thanh-Tam Le on 07/04/2019.
//  Copyright © 2019 Thanh-Tam Le. All rights reserved.
//

import UIKit

class LandingVC: UITabBarController {
    
    // Mark: - Variable
    private var newsFeedVC : NewsFeedVC!
    private var messageVC  : MessageVC!
    private var temp1VC    : MessageVC!
    private var temp2VC    : MessageVC!
    private var temp3VC    : MessageVC!

    private var previousTag = 1
    
    // Mark: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCommon()
        setupTabBarController()
    }
    
    // Mark: - View Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    // Mark: - Memory Warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// Mark: - Setup ViewController
extension LandingVC {
    
    private func initCommon() {
        view.tintColor = #colorLiteral(red: 0.5137254902, green: 0.368627451, blue: 0.9764705882, alpha: 1)
        view.backgroundColor = .white
     
        tabBar.shadowImage                = UIImage()
        tabBar.barTintColor               = AppTheme.tabBarBackgroundColor
        tabBar.backgroundImage            = UIImage()
        
        tabBar.layer.shadowColor          = AppTheme.viewShadowColor.cgColor
        tabBar.layer.shadowOffset         = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius         = 4
        tabBar.layer.shadowOpacity        = 1
        
        tabBar.isTranslucent              = false
        
        delegate = self
    }
    
    private func setupTabBarController() {
        
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.8431372549, green: 0.8078431373, blue: 0.9215686275, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)], for: .normal)
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.5137254902, green: 0.368627451, blue: 0.9764705882, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)], for: .selected)
        
        // Setup navigation controllers
        newsFeedVC      = NewsFeedVC()
        let newsFeedNVC = UINavigationController(rootViewController: newsFeedVC)
        
        messageVC       = MessageVC()
        let messageNVC  = UINavigationController(rootViewController: messageVC)
        
        temp1VC         = MessageVC()
        let temp1NVC    = UINavigationController(rootViewController: temp1VC)

        temp2VC         = MessageVC()
        let temp2NVC    = UINavigationController(rootViewController: temp2VC)

        temp3VC         = MessageVC()
        let temp3NVC    = UINavigationController(rootViewController: temp3VC)

      
        // Add these navigation controllers into tabbar
        viewControllers                   = [newsFeedNVC, messageNVC, temp1NVC, temp2NVC, temp3NVC]
        
        newsFeedVC.tabBarItem             = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "ic_ex_light"), selectedImage: #imageLiteral(resourceName: "ic_ex"))
        newsFeedVC.tabBarItem.tag         = 1
        newsFeedVC.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)

        messageVC.tabBarItem              = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "ic_map_light"), selectedImage: #imageLiteral(resourceName: "ic_map"))
        messageVC.tabBarItem.tag          = 2
        messageVC.tabBarItem.imageInsets  = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
    
        temp1VC.tabBarItem                = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "ic_map_light"), selectedImage: #imageLiteral(resourceName: "ic_map"))
        temp1VC.tabBarItem.tag            = 3
        temp1VC.tabBarItem.imageInsets    = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        temp2VC.tabBarItem                = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "ic_map_light"), selectedImage: #imageLiteral(resourceName: "ic_map"))
        temp2VC.tabBarItem.tag            = 4
        temp2VC.tabBarItem.imageInsets    = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        temp3VC.tabBarItem                = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "ic_map_light"), selectedImage: #imageLiteral(resourceName: "ic_map"))
        temp3VC.tabBarItem.tag            = 5
        temp3VC.tabBarItem.imageInsets    = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
    }
}

// Mark: - TabBarControllerDelegate
extension LandingVC: UITabBarControllerDelegate {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        // Move tableview to top when tapping tab bar messages item
        if item.tag == 1 && previousTag == 1 {
//            if let tableView = messagesViewController.getTableView() {
//                let indexPath = NSIndexPath(row: 0, section: 0)
//                tableView.scrollToRow(at: indexPath as IndexPath, at: .top, animated: true)
//            }
        }
        
        // Set title for tab bar item
//        if item.tag == 1 {
//            title = "messages".uppercased()
//        } else if item.tag == 2 {
//            title = "settings".uppercased()
//        }
        
        previousTag = item.tag
    }
    
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ScrollingTransitionAnimator(tabBarController: tabBarController, lastIndex: tabBarController.selectedIndex)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if selectedViewController == nil || viewController == selectedViewController {
            return false
        }
        
        let fromView = selectedViewController!.view
        let toView = viewController.view
        
        UIView.transition(from: fromView!, to: toView!, duration: 0.4, options: [.transitionCrossDissolve], completion: nil)
        
        return true
    }
}

class ScrollingTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    weak var transitionContext: UIViewControllerContextTransitioning?
    var tabBarController: UITabBarController!
    var lastIndex = 0
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    init(tabBarController: UITabBarController, lastIndex: Int) {
        self.tabBarController = tabBarController
        self.lastIndex = lastIndex
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        self.transitionContext = transitionContext
        
        let containerView = transitionContext.containerView
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        
        containerView.addSubview(toViewController!.view)
        
        var viewWidth = toViewController!.view.bounds.width
        
        if tabBarController.selectedIndex < lastIndex {
            viewWidth = -viewWidth
        }
        
        toViewController!.view.transform = CGAffineTransform(translationX: viewWidth, y: 0)
        
        UIView.animate(withDuration: self.transitionDuration(using: (self.transitionContext)), delay: 0.0, usingSpringWithDamping: 1.2, initialSpringVelocity: 2.5, options: .overrideInheritedOptions, animations: {
            toViewController!.view.transform = CGAffineTransform.identity
            fromViewController!.view.transform = CGAffineTransform(translationX: -viewWidth, y: 0)
        }, completion: { _ in
            self.transitionContext?.completeTransition(!self.transitionContext!.transitionWasCancelled)
            fromViewController!.view.transform = CGAffineTransform.identity
        })
    }
}

