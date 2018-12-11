//
//  FindRoomsCell.swift
//  Mafia
//
//  Created by Александр Харченко on 10/30/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import UIKit

class FindRoomsCell: UITableViewCell {
    
    @IBOutlet weak var rolesInTheGameCollection: UICollectionView!
    @IBOutlet weak var nameRoom: UILabel!
    
    override func awakeFromNib() {
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableData), name: .reload, object: nil)
    }
    
    @objc func reloadTableData(_ notification: Notification) {
        rolesInTheGameCollection.reloadData()
    }
}

extension Notification.Name {
    static let reload = Notification.Name("reload")
}

extension FindRoomsCell {
    
    func setCollectionViewDataSourceDelegate
        <D: UICollectionViewDelegate & UICollectionViewDataSource>
        (_ dataSourceDelegate: D, forRow row: Int) {
        rolesInTheGameCollection.delegate = dataSourceDelegate
        rolesInTheGameCollection.dataSource = dataSourceDelegate
        
        rolesInTheGameCollection.reloadData()
    }
    
}
