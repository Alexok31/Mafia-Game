//
//  FirebaseHelper.swift
//  Mafia
//
//  Created by Александр Харченко on 12/11/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class FirebaseHelper {
    
    static let authorization = Auth.auth()
    static let currentUserId = Auth.auth().currentUser?.uid
    static let databaseRef = Database.database().reference()
}
