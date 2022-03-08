//
//  GeneralScreenPresenter.swift
//  Calculator
//
//  Created by Кирилл Колесников on 15.02.2022.
//

import Foundation

protocol GeneralScreenViewControllerOutput: AnyObject {
    func didEnterDigit(_ didgit: String)
}

protocol GeneralScreenPresenterDelegate: AnyObject {
    func updateScreen()
}


final class GeneralScreenPresenter {
    weak var delegate: GeneralScreenPresenterDelegate?
    weak var coordinator: GeneralCoordinator?
    
    func setViewDelegate(delegate: GeneralScreenPresenterDelegate) {
        self.delegate = delegate
    }

}

extension GeneralScreenPresenter: GeneralScreenViewControllerOutput {
    func didEnterDigit(_ didgit: String) {
        
    }
}
