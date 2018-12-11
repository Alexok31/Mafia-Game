//
//  GameSettingsController.swift
//  Mafia
//
//  Created by Александр Харченко on 10/26/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import UIKit

class MyProfileController : UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var savingIndicator: UILabel!
    
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var changeImage: UIButton!
    
    @IBAction func saveProfileDataButton(_ sender: Any) {
        firebaseMyProfile.changeName(nameTextFild: userNameTextField!)
        savingIndicator.text = "Save"
    }
    
    let firebaseMyProfile = FirebaseMyProfile()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         getСurrentUserInfo()
    }
    
    func getСurrentUserInfo() {
        firebaseMyProfile.getUserInfo { (userInfo) in
            DispatchQueue.main.async {
                self.emailLabel.text = userInfo.email
                self.userNameTextField.text = userInfo.username
            }
        }
    }
}
