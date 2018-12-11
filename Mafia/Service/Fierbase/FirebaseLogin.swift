//
//  LoginController.swift
//  Mafia
//
//  Created by Александр Харченко on 10/22/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//


import LFLoginController
import FirebaseAuth
import FirebaseDatabase

extension MainMenuController: LFLoginControllerDelegate {
    
    
    var isUserAuth: Bool {
        return Auth.auth().currentUser != nil
    }
    
    func loginDidFinish(email: String, password: String, type: LFLoginController.SendType) {
        switch type {
        case .Login:
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                if authResult != nil {
                    self.dismiss(animated: true, completion: nil)
                }
            }
        case .Signup:
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                if authResult != nil {
                    self.addNewUserInFireBase(email: email, password: password, user: authResult)
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    func addNewUserInFireBase(email: String, password: String, user: AuthDataResult?) {
        guard let uid = user?.user.uid else {
            return
        }
        let ref = Database.database().reference()
        let userReference = ref.child("users").child(uid)
        let values = ["email": email]
        userReference.updateChildValues(values, withCompletionBlock: { (error, ref) in
        })
    }
    
    func forgotPasswordTapped(email: String) {
    }
}
