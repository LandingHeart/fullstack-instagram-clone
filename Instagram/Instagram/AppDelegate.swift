//
//  AppDelegate.swift
//  Instagram
//
//  Created by Huang Yan on 10/15/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBlue
        window?.rootViewController = ViewController()
        
        return true
    }


}

