//
//  СreateGameController.swift
//  Mafia
//
//  Created by Александр Харченко on 10/23/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import UIKit

class CreateGameController: UIViewController {

    @IBAction func addMafia(_ sender: Any) {
        let mafia = "Mafia"
        rolesInTheGame.append(mafia)
    }
    @IBAction func addCivilian(_ sender: Any) {
        let civilian = "Civilian"
        rolesInTheGame.append(civilian)
    }
    @IBAction func addDetective(_ sender: Any) {
        let detective = "Detective"
        rolesInTheGame.append(detective)
    }
    @IBAction func addDoctor(_ sender: Any) {
        let doctor = "Doctor"
        rolesInTheGame.append(doctor)
    }
    @IBAction func addProstitute(_ sender: Any) {
        let prostitute = "Prostitute"
        rolesInTheGame.append(prostitute)
    }
    @IBAction func addManiac(_ sender: Any) {
        let maniac = "Maniac"
        rolesInTheGame.append(maniac)
    }
    @IBOutlet weak var collectionOfRoles: UICollectionView!
    @IBOutlet weak var roomName: UITextField!
    @IBOutlet weak var roomPassword: UITextField!
    
    @IBAction func CreateGameButton(_ sender: Any) {
        if value.isEmpty == false && roomName.text?.isEmpty == false {
            FirebaseHelper().handleSendRoles(value, roonName: roomName.text!)
            performSegue(withIdentifier: "goToGame", sender: nil)
        }
    }
    
    let indentifierCell = "RolesId"
    
    var value = [String : Any]()
    var rolesInTheGame = [String](){
        didSet {
            collectionOfRoles.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gameVc = segue.destination as? GameBodyController
        gameVc!.roonName = roomName.text!
    }
}


extension CreateGameController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rolesInTheGame.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: indentifierCell, for: indexPath) as! RolesCell
        value.updateValue(rolesInTheGame[indexPath.row], forKey: "\(indexPath.row)")
        cell.rolesIcon.image = UIImage(named: rolesInTheGame[indexPath.row])
        cell.layer.cornerRadius = cell.frame.height / 2
        
        return cell
    }
    
    
}
