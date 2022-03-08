//
//  GeneralCoordinator.swift
//  Calculator
//
//  Created by Кирилл Колесников on 15.02.2022.
//

import Foundation
import UIKit

final class GeneralCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.isHidden = true
    }
    
    func start() {
        navigateToAuthorizationScreen()
    }
    
    func navigateToAuthorizationScreen() {
        let viewController = AuthorizationScreenViewController()
        let presenter = AuthorizationPresenter(coordinator: self, viewDelegate: viewController)
        
        viewController.inject(with: presenter)
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func navigateToProfileScreen(with profile: Profile) {
        let viewController = ProfileScreenViewController()
        let presenter = ProfilePresenter(coordinator: self, viewDelegate: viewController, profile: profile)
        
        viewController.inject(with: presenter)
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func navigateToArticlesListScreen() {
        let viewController = CalculatorScreenViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func navigateToCalculatorScreen() {
        let viewController = CalculatorScreenViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
