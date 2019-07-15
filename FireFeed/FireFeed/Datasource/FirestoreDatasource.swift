//
//  FirestoreDatasource.swift
//  FireFeed
//
//  Created by Tiago Valente on 29/06/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import Foundation
import Firebase

class FirestoreDatasource {
    
    private init() {}
    static let shared = FirestoreDatasource()
    
    func configure() {
        FirebaseApp.configure()
    }
    
}
