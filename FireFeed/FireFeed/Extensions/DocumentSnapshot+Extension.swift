//
//  DocumentSnapshot+Extension.swift
//  FireFeed
//
//  Created by Tiago Valente on 29/06/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import Foundation
import Firebase

extension DocumentSnapshot {
    func decode<T: Decodable>(as objectType: T.Type) throws -> T {
                
        let documentData = try JSONSerialization.data(withJSONObject: data() as Any, options: [])
        let decodedObject = try JSONDecoder().decode(objectType, from: documentData)
        
        return decodedObject
        
    }
}
