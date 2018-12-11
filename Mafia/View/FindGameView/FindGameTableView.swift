//
//  FindGameTableView.swift
//  Mafia
//
//  Created by Александр Харченко on 12/10/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import Foundation
import UIKit

extension FindGameController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameRooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifierTableView) as! FindRoomsCell
        
        cell.nameRoom.text = nameRooms[indexPath.row]
        getRoles(roomName: cell.nameRoom.text!)
        DispatchQueue.main.async {
            cell.rolesInTheGameCollection.reloadData()
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToFoom", sender: nil)
        SendingToFierbase().handleSendUserInRoom(roonName: nameRooms[listOfRoomsTableView.indexPathForSelectedRow!.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gameVc = segue.destination as? GameBodyController
        gameVc!.roonName = nameRooms[listOfRoomsTableView.indexPathForSelectedRow!.row]
    }
}

