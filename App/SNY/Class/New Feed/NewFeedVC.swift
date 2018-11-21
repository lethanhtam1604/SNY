//
//  NewFeedVC.swift
//  SNY
//
//  Created by Thanh-Tam Le on 15/11/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import UIKit

class NewFeedVC: BaseVC {
    
    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Variables
    private var newFeedDataSource: NewFeedDataSource!
    private var mainNewFeedViewModel = MainNewFeedViewModel()

    // MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCommon()
        setupTableView()
        setupData()
    }
    
    deinit {
        // doing stuff here whether controller is being deinitialized
    }
    
    // MARK: - safeAreaValueDidChange
    override func safeAreaValueDidChange() {
        super.safeAreaValueDidChange()
        
    }
    
    // MARK: - Memory Warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Calling stuff here if memory is low
    }
}

// MARK: - Setup ViewController
extension NewFeedVC {
    
    private func initCommon() {

    }
    
    private func setupTableView() {
        newFeedDataSource = NewFeedDataSource(vcSelf: self, mainNewFeedViewModel: mainNewFeedViewModel)
        tableView.dataSource = newFeedDataSource
        tableView.delegate = newFeedDataSource
        tableView.register(UINib(nibName: NewFeedCell.identifier, bundle: nil), forCellReuseIdentifier: NewFeedCell.identifier)
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = #colorLiteral(red: 0.7490196078, green: 0.7725490196, blue: 0.8, alpha: 1)
        tableView.estimatedRowHeight = 1000
        tableView.rowHeight = UITableView.automaticDimension
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    private func setupData() {
        mainNewFeedViewModel.setupNewFeedViewModels()
        
        mainNewFeedViewModel.reloadDataForTableView = { [weak self] in
            guard let `self` = self else { return }
            self.tableView.reloadData()
        }
    }
}
