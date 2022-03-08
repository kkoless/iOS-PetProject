//
//  AppCoordinator.swift
//  Calculator
//
//  Created by Кирилл Колесников on 15.02.2022.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    func start()
}

final class AppCoordinator: Coordinator {
    let navigationController: UINavigationController
    private let window: UIWindow
    private var generalCoordinator: Coordinator?
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        setupWindow()
        
        self.generalCoordinator = GeneralCoordinator(navigationController: navigationController)
    }
    
    private func setupWindow() {
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    func start() {
        generalCoordinator?.start()
    }
}
