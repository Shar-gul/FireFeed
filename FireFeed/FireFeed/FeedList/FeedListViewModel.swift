//
//  FeedListViewModel.swift
//  FireFeed
//
//  Created by Tiago Valente on 28/06/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import UIKit

class FeedListViewModel: NSObject {
    
    var tableView: UITableView? {
        didSet {
            tableView?.register(FeedTableViewCell.self, forCellReuseIdentifier: FeedTableViewCell.identifier)
            tableView?.dataSource = self
            tableView?.delegate = self
            tableView?.separatorStyle = .singleLine
            tableView?.rowHeight = UITableView.automaticDimension
            tableView?.estimatedRowHeight = 60
        }
    }
    
    var feedList: [FeedItem] = []
    var onFeedItemSelectionEvent: ((FeedItem)->Void)?
    
    func fetchData() {
        
        FFFirebaseService.shared.read(from: .feed, returning: FeedItem.self) { [weak self] items in
            self?.feedList = items
            self?.loadViews()
        }
    }
    
    func loadViews() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView?.reloadData()
        }
    }
    
}

extension FeedListViewModel: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier) as? FeedTableViewCell else {
            return UITableViewCell()
        }
        
        let feedItem = feedList[indexPath.row]
        
        cell.populate(with: feedItem)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.onFeedItemSelectionEvent?(feedList[indexPath.row])
    }
}
