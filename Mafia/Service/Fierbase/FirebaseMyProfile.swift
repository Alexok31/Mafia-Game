//
//  FirebaseMyProfile.swift
//  Mafia
//
//  Created by Александр Харченко on 10/26/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class FirebaseMyProfile {
    
    func getUserInfo(completion: @escaping ((UserStructure) -> ())) {
        let curentId = Auth.auth().currentUser?.uid
        Database.database().reference().child("users").child(curentId!).observe(.value) { (snapshot) in
            
            let dictionary = snapshot.value as? [String : Any]
            let users = GetData().getUser(from: dictionary!)
            completion(users!)
        }
    }
    
    func changeName(nameTextFild: UITextField) {
        let curentId = Auth.auth().currentUser?.uid
        if nameTextFild.text != "" {
            let ref = Database.database().reference()
            ref.child("users/\(String(describing: curentId!))/username").setValue(nameTextFild.text!)
        }
    }
}
