//
//  ProfileScreenViewController.swift
//  PetProject
//
//  Created by Кирилл Колесников on 27.02.2022.
//

import UIKit

final class ProfileScreenViewController: UIViewController {
    private var presenter: ProfilePresenterProtocol?
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Здравствуйте, Гость!"
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        label.textColor = .black
        return label
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "picture")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    private lazy var changeThemeButton: UIButton = {
        makeButton(title: "Изменить фон", action: #selector(changeThemeButtonTap))
    }()
    private lazy var changeNameButton: UIButton = {
        makeButton(title: "Изменить имя", action: #selector(changeNameButtonTap))
    }()
    private lazy var enterButton: UIButton = {
        makeButton(title: "Далее", action: #selector(enterButtonTap))
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.configureUI()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        changeColorViews(with: false)
    }
    
    func inject(with presenter: ProfilePresenterProtocol) {
        self.presenter = presenter
    }
}

private extension ProfileScreenViewController {
    func configureLabel(with name: String) {
        view.addSubview(welcomeLabel)

        welcomeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(100)
            $0.leading.equalToSuperview().offset(70)
            $0.trailing.equalToSuperview().inset(70)
        }
        
        welcomeLabel.text = "Здравствуйте, \(name)!"
    }

    func configureImageView() {
        view.addSubview(profileImageView)

        profileImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(50)
            $0.leading.equalToSuperview().offset(70)
            $0.trailing.equalToSuperview().inset(70)
            $0.height.equalTo(300)
        }
    }

    func configureButtons() {
        view.addSubview(changeThemeButton)
        view.addSubview(changeNameButton)
        view.addSubview(enterButton)

        changeThemeButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(profileImageView.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(70)
            $0.trailing.equalToSuperview().inset(70)
            $0.height.equalTo(50)
        }

        changeNameButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(changeThemeButton.snp.bottom).offset(15)
            $0.width.equalTo(changeThemeButton)
            $0.height.equalTo(changeThemeButton)
        }

        enterButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(changeNameButton.snp.bottom).offset(15)
            $0.width.equalTo(changeNameButton)
            $0.height.equalTo(changeNameButton)
        }
    }
}

private extension ProfileScreenViewController {
    @objc func changeThemeButtonTap() {
        presenter?.changeTheme()
    }

    @objc func changeNameButtonTap() {
        presenter?.changeProfileName()
    }

    @objc func enterButtonTap() {
        presenter?.navigateToArticlesListScreen()
    }
}

extension ProfileScreenViewController: ProfilePresenterDelegate {
    func setupUI(with profile: Profile) {
        view.backgroundColor = .white
        configureLabel(with: profile.name)
        configureImageView()
        configureButtons()
    }
    
    func updateTheme() {
        switch view.backgroundColor {
            case UIColor.white:
                self.changeColorViews(with: true)
                break

            default:
                self.changeColorViews(with: false)
                break
        }
    }

    func updateLabelText(with name: String) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) { [weak self] in
            self?.welcomeLabel.text = "Здравствуйте, \(name)!"
        }
    }
}

private extension ProfileScreenViewController {
    func changeColorViews(with flag: Bool) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) { [weak self] in
            UIApplication.shared.statusBarStyle = flag ? .lightContent : .darkContent
            
            self?.view.backgroundColor = flag ? .black : .white
            self?.welcomeLabel.textColor = flag ? .white : .black
            
            self?.changeNameButton.setTitleColor(flag ? .black : .white, for: .normal)
            self?.changeNameButton.backgroundColor = flag ? .white : .black
            
            self?.enterButton.setTitleColor(flag ? .black : .white, for: .normal)
            self?.enterButton.backgroundColor = flag ? .white : .black
            
            self?.changeThemeButton.setTitleColor(flag ? .black : .white, for: .normal)
            self?.changeThemeButton.backgroundColor = flag ? .white : .black
        }
    }
}

private extension ProfileScreenViewController {
    func makeButton(title: String, isHidden: Bool = false, action: Selector? = nil) -> UIButton {
        let btn = UIButton(frame: .zero)
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 25
        btn.isHidden = isHidden
        if let action = action {
            btn.addTarget(self, action: action, for: .touchUpInside)
        }
        return btn
    }
}
