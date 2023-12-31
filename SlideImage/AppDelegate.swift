//
//  AppDelegate.swift
//  SlideImage
//
//  Created by Egor Mezhin on 21.07.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainViewController = ViewController()
        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()
        
        return true
    }


}

