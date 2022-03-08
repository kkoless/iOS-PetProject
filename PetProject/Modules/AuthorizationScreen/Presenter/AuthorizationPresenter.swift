//
//  AuthorizationPresenter.swift
//  PetProject
//
//  Created by Кирилл Колесников on 22.02.2022.
//

import Foundation

protocol AuthorizationPresenterDelegate: AnyObject {
    /// Methods, which can change/update UI
}

protocol AuthorizationPresenterProtocol: AnyObject {
    func login(name: String, gender: GenderType, age: Int)
}

final class AuthorizationPresenter {
    weak var coordinator: GeneralCoordinator?
    weak var viewDelegate: AuthorizationPresenterDelegate?
    
    func login(name: String, gender: GenderType, age: Int) {
        let profile = Profile(name: name, gender: gender, age: age)
        coordinator?.navigateToProfileScreen(with: profile)
    }
}

extension AuthorizationPresenter: AuthorizationPresenterProtocol {}
