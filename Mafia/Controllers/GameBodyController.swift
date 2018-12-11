//
//  GameBodyController.swift
//  Mafia
//
//  Created by Александр Харченко on 10/25/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import UIKit
import DSCircularCollectionView

class GameBodyController: UIViewController {
    
    @IBOutlet weak var rolesInTheGameCoollection: UICollectionView!
    @IBOutlet var playingField: UICollectionView!
    
    @IBOutlet var selectePlayerView: UIView!
    @IBOutlet weak var nameRoomLabel: UILabel!

    var roonName: String? {
        didSet {
            addUsersIdInGame()
            getCountRolesInGame()
        }
    }
    let rolesInTheGameCoollectionCellId = "RolesInRoomId"
    let playingFieldCellId = "PlayingFieldId"
    
    var сountEachRoleArray = [Int]()
    var nameRolesArray = [String]()
    var countUsersInRoom = [String]()
    var countPlacesInRoom = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        removedUsersIdInGame()
        nameRoomLabel.text = roonName
        selectePlayerView.layer.cornerRadius = selectePlayerView.frame.height / 2
    }
    
    
    func addUsersIdInGame(){
        ObserveToFirebase().observeAddedUsersIdForRoom(roomName: roonName!) { (userId) in
            print("add",userId)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.playingField.performBatchUpdates({
                    self.countUsersInRoom.append(userId)
                    self.playingField.insertItems(at: [IndexPath(item: 0, section: 0)])
                }, completion: nil)
            }
        }
    }
    
    func removedUsersIdInGame() {
        ObserveToFirebase().observeRemovedUsersIdForRoom(roomName: roonName!) { (userId) in
            print("removed", userId)
            let index = self.countUsersInRoom.index(of: userId)
            self.remove(index!)
        }
    }
    
    func remove(_ i: Int) {
        countUsersInRoom.remove(at: i)
        let indexPath = IndexPath(row: i, section: 0)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.playingField.performBatchUpdates({
                self.playingField.deleteItems(at: [indexPath])
            }) { (finished) in
                self.playingField.reloadItems(at: self.playingField.indexPathsForVisibleItems)
            }
        }
    }
    
    func getCountRolesInGame() {
        GameBodyHelper().groupRolesData(roomName: roonName!) { (nameRoles, count) in
            self.nameRolesArray = nameRoles
            self.сountEachRoleArray = count
            self.countPlacesInRoom = count[0]
            self.rolesInTheGameCoollection.reloadData()
        }
    }
    
    @IBAction func leaveTheGame(_ sender: Any) {
        RemoveToFirebase().handleRemoveUserInRoom(roonName: roonName!)
        dismiss(animated: true, completion: nil)
    }
}



