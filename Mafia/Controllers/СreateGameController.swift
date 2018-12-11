//
//  СreateGameController.swift
//  Mafia
//
//  Created by Александр Харченко on 10/23/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import UIKit

class CreateGameController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var collectionOfRoles: UICollectionView!
    @IBOutlet weak var roomName: UITextField!
    @IBOutlet weak var roomPassword: UITextField!
    
    @IBAction func CreateGameButton(_ sender: Any) {
        let rolesInRoom = createGameHelper.rolesInRoom(array: rolesInTheGame)
        if rolesInRoom.isEmpty == false && roomName.text?.isEmpty == false {
            sendingToFierbase.handleSendUserInRoom(roonName: roomName.text!)
            sendingToFierbase.handleSendRolesInRoom(rolesInRoom, roonName: roomName.text!)
            performSegue(withIdentifier: "goToGame", sender: nil)
        }
    }
    
    let indentifierCell = "rolesId"
    let createGameHelper = СreateGameHelper()
    let sendingToFierbase = SendingToFierbase()
    
    var rolesInTheGame = [String](){
        didSet {
            collectionOfRoles.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func addMafia(_ sender: Any) {
        let mafia = "mafia"
        rolesInTheGame.append(mafia)
    }
    @IBAction func addCivilian(_ sender: Any) {
        let civilian = "civilian"
        rolesInTheGame.append(civilian)
    }
    @IBAction func addDetective(_ sender: Any) {
        let detective = "detective"
        rolesInTheGame.append(detective)
    }
    @IBAction func addDoctor(_ sender: Any) {
        let doctor = "doctor"
        rolesInTheGame.append(doctor)
    }
    @IBAction func addProstitute(_ sender: Any) {
        let prostitute = "prostitute"
        rolesInTheGame.append(prostitute)
    }
    @IBAction func addManiac(_ sender: Any) {
        let maniac = "maniac"
        rolesInTheGame.append(maniac)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gameVc = segue.destination as? GameBodyController
        gameVc!.roonName = roomName.text!
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
