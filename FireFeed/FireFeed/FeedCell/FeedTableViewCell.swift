//
//  FeedTableViewCell.swift
//  FireFeed
//
//  Created by Tiago Valente on 28/06/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    let feedLabel: UILabel = UILabel.init()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        feedLabel.numberOfLines = 1
        feedLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(feedLabel)
        
        let topFeedLabelContraint = feedLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
        let leadingFeedLabelContraint = feedLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
        let trailingFeedLabelContraint = feedLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        let bottomFeedLabelContraint = feedLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        
        contentView.addConstraints([topFeedLabelContraint, leadingFeedLabelContraint, trailingFeedLabelContraint, bottomFeedLabelContraint])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func populate(with label: String) {
        feedLabel.text = label
    }
    
}

extension UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
}
