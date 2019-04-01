//
//  MessageVC.swift
//  SNY
//
//  Created by Thanh-Tam Le on 23/10/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import UIKit

class MessageVC: BaseVC {
    
    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var heartImgView: UIImageView!
    
    // MARK: - Variables
    private var messageDataSource: MessageDataSource!
    private var pageNumber = 1
    private var heartStack = Stack<UIImageView>()
    
    // MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCommon()
        setupTableView()
        setupData()
        serialQueue()
    }
    
    // MARK: - safeAreaValueDidChange
    override func safeAreaValueDidChange() {
        super.safeAreaValueDidChange()
        
        print(topSafeArea)
    }
    
    // MARK: - Event
    @objc private func actionTapToHeartImageView() {
        generateAnimatedViews()
    }
    
    // MARK: - Memory Warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

// MARK: - Setup ViewController
extension MessageVC {
    
    private func initCommon() {
        title = "Messages"
        
        heartImgView.isUserInteractionEnabled = true
        heartImgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(actionTapToHeartImageView)))
    }
    
    private func setupTableView() {
        messageDataSource = MessageDataSource()
        tableView.dataSource = messageDataSource
        tableView.delegate = messageDataSource
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .white
        tableView.register(UINib(nibName: MessageLeftCell.identifier, bundle: nil), forCellReuseIdentifier: MessageLeftCell.identifier)
        tableView.register(UINib(nibName: MessageRightCell.identifier, bundle: nil), forCellReuseIdentifier: MessageRightCell.identifier)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    private func setupData() {
        let chatMessages = fetchingNewMessages()
        let messageViewModels = chatMessages.map { (model) -> MessageViewModel in
            return MessageViewModel(item: model)
        }
        messageDataSource.append(messageViewModels)
    }
    
    private func fetchingNewMessages() -> [ChatMessage] {
        let chatMessages = [
            ChatMessage(content: "Here's my very first message", date: "12-3-2018", isIncoming: true),
            ChatMessage(content: "I'm going to message another long message that will word wrap",  date: "12-3-2018", isIncoming: true),
            ChatMessage(content: "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap", date: "12-3-2018", isIncoming: false),
            ChatMessage(content: "Yo, dawg, Whaddup!", date: "12-3-2018", isIncoming: false),
            ChatMessage(content: "This message should appear on the left with a white background bubble",  date: "12-3-2018", isIncoming: true),
            ChatMessage(content: "Here's my very first message", date: "12-3-2018", isIncoming: true),
            ChatMessage(content: "I'm going to message another long message that will word wrap",  date: "12-3-2018", isIncoming: true),
            ChatMessage(content: "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap", date: "12-3-2018", isIncoming: true),
            ChatMessage(content: "Yo, dawg, Whaddup!", date: "12-3-2018", isIncoming: false),
            ChatMessage(content: "This message should appear on the left with a white background bubble",  date: "12-3-2018", isIncoming: true),
            ChatMessage(content: "Here's my very first message", date: "12-3-2018", isIncoming: true),
            ChatMessage(content: "I'm going to message another long message that will word wrap",  date: "12-3-2018", isIncoming: true),
            ChatMessage(content: "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap", date: "12-3-2018", isIncoming: true),
            ChatMessage(content: "Yo, dawg, Whaddup!", date: "12-3-2018", isIncoming: false),
            ChatMessage(content: "This message should appear on the left with a white background bubble",  date: "12-3-2018", isIncoming: true)
        ]
        return chatMessages
    }
}

extension MessageVC {
    
    private func generateAnimatedViews() {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "ic_heart"))
        let dimension = 20 + drand48() * 10
        imageView.frame =  CGRect(x: 0, y: 0, width: dimension, height: dimension)
        
        CATransaction.begin()
        CATransaction.setCompletionBlock({
            imageView.removeFromSuperview()
        })
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = customPath().cgPath
        animation.duration = 3 + drand48() * 3
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.delegate = self
        imageView.layer.add(animation, forKey: nil)
        CATransaction.commit()
        view.addSubview(imageView)
        heartStack.push(imageView)
    }
    
    private func customPath() -> UIBezierPath {
        let ogirin = heartImgView.frame.origin
        let path = UIBezierPath()
        path.move(to: CGPoint(x: ogirin.x + heartImgView.frame.size.width / 2, y: ogirin.y - heartImgView.frame.size.height / 2))
        let randomYShift = 100 + drand48() * 120
        let negativeR = Double.random(in: -1.5...1)
        let endPoint = CGPoint(x: 100 + negativeR * randomYShift, y: 0)
        let cp1 = CGPoint(x: Double(ogirin.x) - negativeR * randomYShift, y: Double(ogirin.y) - randomYShift)
        let cp2 = CGPoint(x: Double(ogirin.x) - 100 - randomYShift, y: Double(ogirin.y) - 100 - randomYShift)
        path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
        return path
    }
}

extension MessageVC: CAAnimationDelegate {
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
    }
}

// GCD
extension MessageVC {
    
    private func serialQueue() {
        defer {
            print("tam")
        }
        let queue = DispatchQueue(label: "queue.1")
        queue.async {
            for i in 0..<10 {
                print("🔷", i)
            }
        }
        queue.async {
            for i in 10..<20 {
                print("🔷", i)
            }
//            DispatchQueue.main.sync {
                //self.tableView.reloadData()
//            }
        }
        // Main thread
//                for i in 20..<30 {
//                    print("⚪️", i)
//                }
    }
    
    private func concurrentQueue() {
        defer {
            print("tam")
        }
//        let queue = DispatchQueue(label: "concurrentQueue", qos: .userInitiated, attributes: .concurrent)
//        queue.sync {
//            for i in 0..<10 {
//                print("🔷", i)
//            }
//        }
//        queue.sync {
//            for i in 20..<30 {
//                print("🔷", i)
//            }
//        }
        
        
        let globalQueue = DispatchQueue.global(qos: .userInteractive)
        globalQueue.async {
            for i in 0..<10 {
                print("🔷", i)
            }
        }
        globalQueue.async {
            for i in 10..<20 {
                print("🔷", i)
            }
        }
        
        // Main thread
//        for i in 30..<40 {
//            print("⚪️", i)
//        }
    }
}


// NSOperation
extension MessageVC {
    
    private func operationTest() {
        let dispatchGroup = DispatchGroup.init()
        dispatchGroup.enter()
        dispatchGroup.notify(queue: .main) {
            print("Finished all task")
        }
        
        let queue = OperationQueue()
        
        let operation1 = BlockOperation {

        }
   

        operation1.addExecutionBlock {
            for i in 0..<10 {
                print("🔷", i)
            }
            dispatchGroup.leave()
        }
        
        operation1.addExecutionBlock {
            for i in 10..<20 {
                print("🔷", i)
            }
        }
        
        operation1.completionBlock = {
            print("tam1")
        }
        
        let operation2 = BlockOperation {
            for i in 20..<30 {
                print("🔷", i)
            }
        }
        operation2.completionBlock = {
            print("tam2")
        }
        operation1.addDependency(operation2)
        
        queue.addOperation(operation1)
        queue.addOperation(operation2)
        queue.maxConcurrentOperationCount = 4
    }
}
