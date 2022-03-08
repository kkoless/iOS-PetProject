//
//  GeneralPresenter.swift
//  Calculator
//
//  Created by Кирилл Колесников on 22.02.2022.
//

import Foundation

protocol GeneralPresenterViewDelegate {
    func setupUI()
    func updateBackgroundColor()
    func updateLabelText(name: String)
}

protocol GeneralPresenterProtocol {
    func configureUI()
    func changeBackroundColor()
    func changeLabelText(text: String?)
    func navigateToSecondScreen()
}

final class GeneralPresenter {
    private let coordinator: GeneralCoordinator
    private let viewDelegate: GeneralPresenterViewDelegate
    
    init(coordinator: GeneralCoordinator, viewDelegate: GeneralPresenterViewDelegate) {
        self.coordinator = coordinator
        self.viewDelegate = viewDelegate
    }
    
    func configureUI() {
        viewDelegate.setupUI()
    }
    
    func changeBackroundColor() {
        viewDelegate.updateBackgroundColor()
    }
    
    func changeLabelText(text: String?) {
        guard let text = text else { return }
        viewDelegate.updateLabelText(name: !text.isEmpty ? text : "Гость")
    }
    
    func navigateToSecondScreen() {
        coordinator.navigateToCalculatorScreen()
    }
}

extension GeneralPresenter: GeneralPresenterProtocol {}
