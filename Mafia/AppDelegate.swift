//
//  AppDelegate.swift
//  Mafia
//
//  Created by Александр Харченко on 10/22/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
       
       // self.saveContext()
    }
}

