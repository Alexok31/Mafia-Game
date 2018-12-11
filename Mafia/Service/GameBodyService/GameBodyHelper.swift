//
//  GameBodyHelper.swift
//  Mafia
//
//  Created by Александр Харченко on 10/30/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import Foundation


class GameBodyHelper {
    
    var сountEachRoleArray = [Int]()
    var nameRolesArray = [String]()
    
    func groupRolesData(roomName: String,  completion: @escaping (([String], [Int]) -> ())){
        ObserveToFirebase().observeRolesForRoom(roomName: roomName) { (rolesData) in
            self.fillingArrays("mafia", roleCount: rolesData.mafia)
            self.fillingArrays("civilian", roleCount: rolesData.civilian)
            self.fillingArrays("detective", roleCount: rolesData.detective)
            self.fillingArrays("doctor", roleCount: rolesData.doctor)
            self.fillingArrays("maniac", roleCount: rolesData.maniac)
            self.fillingArrays("prostitute", roleCount: rolesData.prostitute)
            
            let totalPlayers = self.сountEachRoleArray.reduce(0, +)
            self.сountEachRoleArray.insert(totalPlayers, at: 0)
            self.nameRolesArray.insert("totalPlayers", at: 0)
            completion(self.nameRolesArray, self.сountEachRoleArray)
        }
    }
    
    func fillingArrays(_ roleName: String, roleCount: Int?) {
        if roleCount != nil {
            сountEachRoleArray.append(roleCount!)
            nameRolesArray.append(roleName)
           
            
        }
    }
    
}
