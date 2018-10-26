//
//  GameBodyHelper.swift
//  Mafia
//
//  Created by Александр Харченко on 10/26/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import Foundation

class СreateGameHelper {
    
    var dictionary = [String: Any]()
    
    func rolesInRoom(array: [String]) -> [String: Any] {
        let mafiaCount = countIdenticalValues(role: "Mafia", array: array)
        let civilianCount = countIdenticalValues(role: "Civilian", array: array)
        let detectiveCount = countIdenticalValues(role: "Detective", array: array)
        let doctorCount = countIdenticalValues(role: "Doctor", array: array)
        let prostituteCount = countIdenticalValues(role: "Prostitute", array: array)
        let maniacCount = countIdenticalValues(role: "Maniac", array: array)
        gettingRidOfZero(value: mafiaCount, key: "Mafia")
        gettingRidOfZero(value: civilianCount, key: "Civilian")
        gettingRidOfZero(value: detectiveCount, key: "Detective")
        gettingRidOfZero(value: doctorCount, key: "Doctor")
        gettingRidOfZero(value: prostituteCount, key: "Prostitute")
        gettingRidOfZero(value: maniacCount, key: "Maniac")
        return dictionary
    }
    
    func gettingRidOfZero(value: Int, key: String) {
        if value != 0 {
            dictionary.updateValue(value, forKey: key)
        }
    }
    
    func countIdenticalValues(role: String, array: [String]) -> Int {
        var roleCount = 0
        for i in array {
            if i == role {
                roleCount += 1
            }
        }
        return roleCount
    }
    
    
}
