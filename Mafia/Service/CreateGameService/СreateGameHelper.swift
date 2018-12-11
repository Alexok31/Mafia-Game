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
        let mafiaCount = countIdenticalValues(role: "mafia", array: array)
        let civilianCount = countIdenticalValues(role: "civilian", array: array)
        let detectiveCount = countIdenticalValues(role: "detective", array: array)
        let doctorCount = countIdenticalValues(role: "doctor", array: array)
        let prostituteCount = countIdenticalValues(role: "prostitute", array: array)
        let maniacCount = countIdenticalValues(role: "maniac", array: array)
        gettingRidOfZero(value: mafiaCount, key: "mafia")
        gettingRidOfZero(value: civilianCount, key: "civilian")
        gettingRidOfZero(value: detectiveCount, key: "detective")
        gettingRidOfZero(value: doctorCount, key: "doctor")
        gettingRidOfZero(value: prostituteCount, key: "prostitute")
        gettingRidOfZero(value: maniacCount, key: "maniac")
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
