//
//  File.swift
//  Mafia
//
//  Created by Александр Харченко on 10/22/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import Foundation
import CoreData

class PersistentManager {
    
    private init () {}
    static let shared = PersistentManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Mafia")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    lazy var context = persistentContainer.viewContext
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
                print("save")
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
