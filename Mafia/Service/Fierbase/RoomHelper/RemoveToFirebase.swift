//
//  RemoveToFirebase.swift
//  Mafia
//
//  Created by Александр Харченко on 12/11/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class RemoveToFirebase {
    
    func handleRemoveUserInRoom(roonName: String) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let ref = Database.database().reference().child("rooms")
        let childFef = ref.child(roonName).child("users").child(uid)
        childFef.removeValue()
    }
}
