//
//  FFFirebaseService.swift
//  FireFeed
//
//  Created by Tiago Valente on 29/06/2019.
//  Copyright © 2019 Tiago Valente. All rights reserved.
//

import Foundation
import Firebase

class FFFirebaseService {
    
    private init() {}
    static let shared = FFFirebaseService()
    
    func configure() {
        FirebaseApp.configure()
        
        let db = Firestore.firestore()
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
    }
    
    private func reference(to collectionReference: FFCollectionReference) -> CollectionReference {
        return Firestore.firestore().collection(collectionReference.rawValue)
    }
    
    func read<T: Decodable>(from collectionReference: FFCollectionReference, returning objectType: T.Type, completion: @escaping([T]) -> Void) {
        reference(to: collectionReference).addSnapshotListener { (snapshot, _) in
            guard let snapshot = snapshot else { return }
            
            do {
                var objectsArray = [T]()
                for document in snapshot.documents {
                    let object = try document.decode(as: objectType.self)
                    objectsArray.append(object)
                }
                completion(objectsArray)
            } catch {
                print(error)
            }
            
        }
    }
    
}
