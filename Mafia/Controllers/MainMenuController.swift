//
//  ViewController.swift
//  Mafia
//
//  Created by Александр Харченко on 10/22/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import UIKit
import LFLoginController

class MainMenuController: UIViewController {

    @IBAction func logOutButton(_ sender: Any) {
        logout()
    }
    @IBAction func findGameButton(_ sender: Any) {
       
    }
    
    @IBOutlet weak var createGameButton: UIButton!
    
    let loginController = LFLoginController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkUserIsLogin()
       
    }
    
    func checkUserIsLogin() {
        if !isUserAuth {
            loginController.delegate = self
            present(loginController, animated: true, completion: nil)
        }
    }
    
    func logout() {
        do {
            try FirebaseHelper().authorization.signOut()
        } catch let loginError {
            print(loginError)
        }
        present(loginController, animated: true, completion: nil)
    }
 
}





