//
//  ProfilePresenter.swift
//  PetProject
//
//  Created by Кирилл Колесников on 28.02.2022.
//

import Foundation

protocol ProfilePresenterDelegate: AnyObject {
    func setupUI(with profile: Profile)
    func updateTheme()
    func updateLabelText(with name: String)
}

protocol ProfilePresenterProtocol: AnyObject {
    func configureUI()
    func navigateToArticlesListScreen()
    func changeProfileName(name: String)
    func changeTheme()
}

final class ProfilePresenter {
    weak var coordinator: GeneralCoordinator?
    weak var viewDelegate: ProfilePresenterDelegate?
    private var profile: Profile
    
    init(profile: Profile) {
        self.profile = profile
    }
    
    func configureUI() {
        viewDelegate?.setupUI(with: profile)
    }
    
    func navigateToArticlesListScreen() {
        coordinator?.navigateToArticlesListScreen()
    }
    
    func changeProfileName(name: String) {
        self.profile.name = name
        viewDelegate?.updateLabelText(with: profile.name)
    }
    
    func changeTheme() {
        viewDelegate?.updateTheme()
    }
}

extension ProfilePresenter: ProfilePresenterProtocol {}
