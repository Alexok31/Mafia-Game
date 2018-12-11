//
//  FindGameCollectionView.swift
//  Mafia
//
//  Created by Александр Харченко on 12/10/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import Foundation
import UIKit


extension FindGameController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return сountEachRoleArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: indentifierCollectionView, for: indexPath) as! RolesInListGameCell
        cell.roleCount.text = "\(сountEachRoleArray[indexPath.row])"
        cell.roleImage.image = UIImage(named: nameRolesArray[indexPath.row])
        
        return cell
    }
}
