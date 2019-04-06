//
//  LoginVC.swift
//  SNY
//
//  Created by Thanh-Tam Le on 09/10/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import UIKit
import CoreData

class LoginVC: BaseVC {
    
    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var indicator: UIActivityIndicatorView!
    
    // MARK: - Variables
    private let dataSource = LoginDataSource()

    // MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCommon()
        setupTableView()
        //saveInCoreData()
        //fetchingData()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    @objc func handleTap() {
        (0...10).forEach { (_) in
            generateAnimatedViews()
        }
    }
    
    // MARK: - Memory Warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

// MARK: - Setup ViewController
extension LoginVC {
    
    private func initCommon() {
        indicator.color = .red
    }
    
    private func setupTableView() {
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.backgroundColor = .clear
        tableView.register(UINib(nibName: LoginCell.identifier, bundle: nil), forCellReuseIdentifier: LoginCell.identifier)
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
    }
    
    private func generateAnimatedViews() {
        let image = drand48() > 0.5 ? #imageLiteral(resourceName: "ic_heart") : #imageLiteral(resourceName: "ic_like")
        let imageView = UIImageView(image: image)
        let dimension = 20 + drand48() * 10
        imageView.frame = CGRect(x: 0, y: 0, width: dimension, height: dimension)
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        
        animation.path = customPath().cgPath
        animation.duration = 2 + drand48() * 3
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        
        imageView.layer.add(animation, forKey: nil)
        view.addSubview(imageView)
    }
    
    private func customPath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 500))
        let randomYShift = 100 + drand48() * 300
        let endPoint = CGPoint(x: 400, y: 200)
        let cp1 = CGPoint(x: 100, y: 100 - randomYShift)
        let cp2 = CGPoint(x: 200, y: 300 - randomYShift)
        path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
        return path
    }
}

// MARK: -
extension LoginVC {
    
    private func saveInCoreData()  {
        indicator.startAnimating()
        let managedContext = CoreDataHelper.managedObjectContext
        let privateMOC = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        privateMOC.parent = managedContext
        privateMOC.perform {
            for index in 1...100000 {
                let user  = NSManagedObject(entity: NSEntityDescription.entity(forEntityName: "User", in: managedContext)!, insertInto: privateMOC) as! User
                user.id = NSNumber(value: index).int32Value
                user.userName = "Tam \(Int.random(in: 1...1000))"
            }
            do {
                try privateMOC.save()
                managedContext.performAndWait({
                    do {
                        try managedContext.save()
                        //DispatchQueue.main.async {
                            self.indicator.stopAnimating()
                            self.fetchingData()
                        //}
                    } catch {
                        fatalError("Failure to save context: \(error)")
                    }
                })
                
            } catch let error as NSError {
                print(error.description)
            }
        }
    }
    
    private func fetchingData() {
        var users: [User] = []
        let managedContext = CoreDataHelper.managedObjectContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        let entity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)
        fetchRequest.entity = entity!
        do {
            let items = try managedContext.fetch(fetchRequest)
            for item in items {
                users.append(item as! User)
            }
            dataSource.append(users)
            tableView.reloadData()
        } catch let error as NSError {
            print(error.description)
        }
    }
}
