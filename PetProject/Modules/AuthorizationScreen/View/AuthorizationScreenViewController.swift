//
//  AuthorizationScreenViewController.swift
//  PetProject
//
//  Created by Кирилл Колесников on 22.02.2022.
//

import UIKit
import SnapKit

final class AuthorizationScreenViewController: UIViewController {
    private var presenter: AuthorizationPresenterProtocol?
    
    private lazy var authorizationFormView: AuthorizationFormView = {
        let form = AuthorizationFormView(frame: .zero)
        
        form.loginButtonTapAction = { [weak self] name, gender, age in
            self?.presenter?.login(name: name, gender: gender, age: age)
        }
        
        return form
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func inject(with presenter: AuthorizationPresenterProtocol) {
        self.presenter = presenter
    }
}

private extension AuthorizationScreenViewController {
    func configureUI() {
        configureView()
        configureFormView()
    }
    
    func configureView() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func configureFormView() {
        view.addSubview(authorizationFormView)
        
        authorizationFormView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

private extension AuthorizationScreenViewController {
    @objc func hideKeyboard() {
        authorizationFormView.endEditing(true)
    }
}

extension AuthorizationScreenViewController: AuthorizationPresenterDelegate {}
