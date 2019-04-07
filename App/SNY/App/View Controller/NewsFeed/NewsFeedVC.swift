//
//  NewsFeedVC.swift
//  SNY
//
//  Created by Thanh-Tam Le on 15/11/2018.
//  Copyright © 2018 Thanh-Tam Le. All rights reserved.
//

import UIKit
import SkeletonView

class NewsFeedVC: BaseVC {
    
    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Variables
    private var newsFeedDataSource: NewsFeedDataSource!
    private var mainNewsFeedViewModel = MainNewsFeedViewModel()

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
extension NewsFeedVC {
    
    private func initCommon() {

    }
    
    private func setupTableView() {
        newsFeedDataSource           = NewsFeedDataSource(vcSelf: self, mainNewsFeedViewModel: mainNewsFeedViewModel)
        tableView.dataSource         = newsFeedDataSource
        tableView.delegate           = newsFeedDataSource
        tableView.register(UINib(nibName: NewsFeedCell.identifier, bundle: nil), forCellReuseIdentifier: NewsFeedCell.identifier)
        tableView.register(UINib(nibName: NewsFeedOnlyTextCell.identifier, bundle: nil), forCellReuseIdentifier: NewsFeedOnlyTextCell.identifier)
        tableView.separatorStyle     = .none
        tableView.tableFooterView    = UIView()
        tableView.backgroundColor    = #colorLiteral(red         : 0.7490196078, green         : 0.7725490196, blue         : 0.8, alpha         : 1)
        tableView.contentInset       = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        //tableView.estimatedRowHeight = 250
        //tableView.rowHeight          = UITableView.automaticDimension

    }
    
    private func setupData() {
        mainNewsFeedViewModel.setupNewsFeedViewModels()
        
        mainNewsFeedViewModel.reloadDataForTableView = { [weak self] in
            guard let `self` = self else { return }
            self.tableView.reloadData()
        }
    }
}
