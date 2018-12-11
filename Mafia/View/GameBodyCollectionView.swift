//
//  TopBarPlayers.swift
//  Mafia
//
//  Created by Александр Харченко on 10/30/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import Foundation
import UIKit


extension GameBodyController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case rolesInTheGameCoollection:
            return nameRolesArray.count
        case playingField:
            return countUsersInRoom.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case rolesInTheGameCoollection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: rolesInTheGameCoollectionCellId, for: indexPath) as! RolesInRoomCell
            cell.imageRole.image = UIImage(named: nameRolesArray[indexPath.row])
            cell.numberOfPlayers.text = "\(сountEachRoleArray[indexPath.row])"
            return cell
            
        case playingField:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: playingFieldCellId, for: indexPath) as! PayingFieldCell
             cell.layer.cornerRadius = cell.frame.height / 2
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: rolesInTheGameCoollectionCellId, for: indexPath) as! RolesInRoomCell
            return cell
        }
    }
}
