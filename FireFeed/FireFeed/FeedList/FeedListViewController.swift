//
//  FeedListViewController.swift
//  FireFeed
//
//  Created by Tiago Valente on 28/06/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import UIKit

class FeedListViewController: UIViewController {
    
    var viewModel: FeedListViewModel
    
    init() {
        self.viewModel = FeedListViewModel.init()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        
        let tableView = UITableView.init(frame: CGRect.zero, style: .plain)
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let tableViewTopConstraint = tableView.topAnchor.constraint(equalTo: view.topAnchor)
        let tableViewLeadingConstraint = tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let tableViewTrailingConstraint = tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let tableViewBottomConstraint = tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        viewModel.tableView = tableView
        
        view.addConstraints([tableViewTopConstraint, tableViewLeadingConstraint, tableViewTrailingConstraint, tableViewBottomConstraint])
        
        viewModel.onFeedItemSelectionEvent = { item in
            print(item)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchData()
    }
    
}
