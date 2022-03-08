//
//  AppCoordinator.swift
//  PetProject
//
//  Created by Кирилл Колесников on 15.02.2022.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
}

final class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    private let window: UIWindow
    private let navigationController: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start() {
        window.rootViewController = navigationController
        
        let generalCoordinator = GeneralCoordinator(navigationController: navigationController)
        self.childCoordinators.append(generalCoordinator)
        generalCoordinator.start()
        
        window.makeKeyAndVisible()
    }
}
