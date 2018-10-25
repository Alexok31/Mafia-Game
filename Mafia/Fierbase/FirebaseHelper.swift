//
//  FirebaseHelper.swift
//  Mafia
//
//  Created by Александр Харченко on 10/23/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

protocol CanReceiveRoom {
    func receiveRoom (roomName: String)
}

class FirebaseHelper {
    
    let authorization = Auth.auth()
    
    func handleSendRoles(_ rolesDictionary : [String: Any], roonName: String) {
        let ref =  Database.database().reference().child("rooms")
        let childFef = ref.child(roonName).child("roles")
        childFef.updateChildValues(rolesDictionary) { (error, ref) in
            if error != nil  {
                print(error!)
                return
            }
        }
    }
    
    func observeRoom(roomName: String, completion: @escaping (([String: Any]) -> ())) {
        let roomRef = Database.database().reference().child("rooms").child(roomName)
        roomRef.observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            completion(dictionary)
        }
    }
    
}
