//
//  GeneralCoordinator.swift
//  PetProject
//
//  Created by Кирилл Колесников on 15.02.2022.
//

import Foundation
import UIKit

final class GeneralCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.isHidden = true
    }
    
    func start() {
        navigateToAuthorizationScreen()
    }
    
    func navigateToAuthorizationScreen() {
        let viewController = AuthorizationScreenViewController()
        let presenter = AuthorizationPresenter()
        
        viewController.inject(with: presenter)
        presenter.viewDelegate = viewController
        presenter.coordinator = self
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func navigateToProfileScreen(with profile: Profile) {
        let viewController = ProfileScreenViewController()
        let presenter = ProfilePresenter(profile: profile)
        
        viewController.inject(with: presenter)
        presenter.viewDelegate = viewController
        presenter.coordinator = self
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func navigateToArticlesListScreen() {
        let viewController = ArticlesListScreenViewController()
        let articleService = ArticleService()
        let presenter = ArticlesListPresenter(articleService: articleService)
        
        viewController.inject(with: presenter)
        presenter.viewDelegate = viewController
        presenter.coordinator = self
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func pop() {
        navigationController.popViewController(animated: true)
    }
}
