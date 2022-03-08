//
//  AppDelegate.swift
//  PetProject
//
//  Created by Кирилл Колесников on 15.02.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    weak var window: UIWindow?
    var coordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let appCoordinator = AppCoordinator(window: window)
        
        self.window = window
        self.coordinator = appCoordinator
        
        self.coordinator?.start()
        
        return true
    }
    
}

