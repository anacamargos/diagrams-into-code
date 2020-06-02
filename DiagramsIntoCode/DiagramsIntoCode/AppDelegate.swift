//
//  AppDelegate.swift
//  DiagramsIntoCode
//
//  Created by Ana Leticia Camargos on 02/06/20.
//  Copyright © 2020 Ana Leticia Camargos. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        setupInitialController()
        return true
    }
    
    private func setupInitialController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = FeedViewController(loader: RemoteWithLocalFallbackFeedLoader())
        window?.makeKeyAndVisible()
    }
}
