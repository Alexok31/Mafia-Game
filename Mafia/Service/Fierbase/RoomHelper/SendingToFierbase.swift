//
//  SendingToFirebse.swift
//  Mafia
//
//  Created by Александр Харченко on 12/11/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class SendingToFierbase {
    
    func handleSendUserInRoom(roonName: String) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let ref = Database.database().reference().child("rooms")
        let childFef = ref.child(roonName).child("users")
        childFef.updateChildValues([uid : "id"])
    }
    
    
    func handleSendRolesInRoom(_ rolesDictionary : [String: Any], roonName: String) {
        let ref =  Database.database().reference().child("rooms")
        let childFef = ref.child(roonName).child("roles")
        childFef.updateChildValues(rolesDictionary) { (error, ref) in
            if error != nil  {
                print(error!)
                return
            }
        }
    }
    
}
