//
//  GetData.swift
//  Mafia
//
//  Created by Александр Харченко on 10/26/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import Foundation

class GetData {
    
    func getUser(from dictionary: [String : Any]) -> UserStructure? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
            return try JSONDecoder().decode(UserStructure.self, from: jsonData)
        } catch {
            return nil
        }
    }
    
    func getRoles(from dictionary: [String : Any]) -> RolesStructure? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
            return try JSONDecoder().decode(RolesStructure.self, from: jsonData)
        } catch {
            return nil
        }
    }
}
