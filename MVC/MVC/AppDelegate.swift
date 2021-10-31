//
//  AppDelegate.swift
//  MVC
//
//  Created by Мехрафруз on 31.10.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let appCoordinator = AppCoordinator()
        window?.rootViewController = appCoordinator.startApplication()
        return true
    }

}

