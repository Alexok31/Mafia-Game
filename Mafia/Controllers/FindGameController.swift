//
//  FindGameController.swift
//  Mafia
//
//  Created by Александр Харченко on 10/30/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import UIKit

class FindGameController: UIViewController {
    
    @IBOutlet weak var listOfRoomsTableView: UITableView!
    
    let indentifierTableView = "nameRoomsId"
    let indentifierCollectionView = "listRolesId"
    
    var nameRooms = [String]()
    var сountEachRoleArray = [Int]()
    var nameRolesArray = [String]()
    var array = [[Int]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeNameOfRooms()
    }
    
    func observeNameOfRooms() {
        ObserveToFirebase().observeNameOfRooms { (name) in
            self.nameRooms = name
            DispatchQueue.main.async {
                self.listOfRoomsTableView.reloadData()
            }
        }
    }
    
    func getRoles(roomName: String) {
        GameBodyHelper().groupRolesData(roomName: roomName) { (nameRoles, count) in
                self.nameRolesArray = nameRoles
                self.сountEachRoleArray = count
        }
    }
}


