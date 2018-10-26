//
//  GameBodyController.swift
//  Mafia
//
//  Created by Александр Харченко on 10/25/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import UIKit

class GameBodyController: UIViewController {
    
    
    @IBOutlet weak var rolesInTheGameCoollection: UICollectionView!
    @IBOutlet weak var nameRoomLabel: UILabel!
    
    var roonName: String?
    var rolesArray = [String]()
    var identicalRolesArray = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameRoomLabel.text = roonName
    }
}


//extension GameBodyController: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 5
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//         return nil
//    }
//
//
//}
