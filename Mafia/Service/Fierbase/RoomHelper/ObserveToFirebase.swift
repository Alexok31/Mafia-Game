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


class ObserveToFirebase {
    
    var roomsName = [String]()
    
    func observeRolesForRoom(roomName: String, completion: @escaping ((RolesStructure) -> ())) {
        let roomRef = Database.database().reference().child("rooms").child(roomName).child("roles")
        roomRef.observe(.value) { (snapshot) in
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            let roles = GetData().getRoles(from: dictionary)
            completion(roles!)
        }
    }
    
    func observeAddedUsersIdForRoom(roomName: String, completion: @escaping ((String) -> ())) {
        let roomRef = Database.database().reference().child("rooms").child(roomName).child("users")
        roomRef.observe(.childAdded) { (snapshot) in
            let user = snapshot.key
            completion(user)
        }
    }
    
    func observeNameOfRooms(completion: @escaping (([String]) -> ())) {
        let roomRef = Database.database().reference().child("rooms")
        roomRef.observe(.childAdded) { (snapshot) in
            let nameRooms = snapshot.key
            self.roomsName.append(nameRooms)
            completion(self.roomsName)
        }
    }
    
    func observeRemovedUsersIdForRoom(roomName: String, completion: @escaping ((String) -> ())) {
        let roomRef = Database.database().reference().child("rooms").child(roomName).child("users")
        roomRef.observe(.childRemoved) { (snapshot) in
            let user = snapshot.key
            completion(user)
        }
    }
}
