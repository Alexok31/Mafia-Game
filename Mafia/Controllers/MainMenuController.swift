//
//  ViewController.swift
//  Mafia
//
//  Created by Александр Харченко on 10/22/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import UIKit
import LFLoginController

class MainMenuController: UIViewController, UIPopoverPresentationControllerDelegate {

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
            try FirebaseHelper.authorization.signOut()
        } catch let loginError {
            print(loginError)
        }
        present(loginController, animated: true, completion: nil)
    }
    
    @IBAction func createGame(_ sender: Any) {
        let popover = storyboard?.instantiateViewController(withIdentifier: "CreateGameId") as! CreateGameController
        popover.modalPresentationStyle = UIModalPresentationStyle.popover
        popover.popoverPresentationController?.delegate = self
        popover.popoverPresentationController?.sourceView = self.view
        popover.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: self.view.frame.width - 10, height: 0)
        popover.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
        self.present(popover, animated: true, completion: nil)
        
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}





