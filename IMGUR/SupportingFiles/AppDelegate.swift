//
//  AppDelegate.swift
//  IMGUR
//
//  Created by Miguel Angel Gomez Rivero on 8/27/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let itemsTableViewController = storyboard.instantiateViewController(withIdentifier: "ItemsTableViewController") as? ItemsTableViewController else {
            return true
        }
        let navigationController = UINavigationController(rootViewController: itemsTableViewController)
        
        let screen = UIScreen.main
        window = UIWindow(frame: screen.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
       
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
       
    }
}

