//
//  CreateGameCollectionView.swift
//  Mafia
//
//  Created by Александр Харченко on 12/10/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import Foundation
import UIKit

extension CreateGameController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rolesInTheGame.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: indentifierCell, for: indexPath) as! RolesCell
        cell.rolesIcon.image = UIImage(named: rolesInTheGame[indexPath.row])
        cell.layer.cornerRadius = cell.frame.height / 2
        
        return cell
    }
    
    
}
