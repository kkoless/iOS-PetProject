//
//  GeneralScreenViewController.swift
//  Calculator
//
//  Created by Кирилл Колесников on 22.02.2022.
//

import UIKit
import SnapKit


final class GeneralScreenViewController: UIViewController {
    private var presenter: GeneralPresenterProtocol?
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel(frame: .zero)
        
        label.text = "Здравствуйте, Гость!"
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var pictureImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        
        imageView.image = UIImage(named: "picture")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        
        return imageView
    }()
    
    private lazy var inputTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        
        textField.textColor = .white
        textField.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        textField.placeholder = "Введите имя"
        
        return textField
    }()
    
    private lazy var firstButton: UIButton = {
        let btn = makeButton(title: "Изменить фон")
        btn.addTarget(self, action: #selector(firstButtonTap), for: .touchUpInside)
        return btn
    }()
    
    private lazy var secondButton: UIButton = {
        let btn = makeButton(title: "Изменить текст")
        btn.addTarget(self, action: #selector(secondButtonTap), for: .touchUpInside)
        return btn
    }()
    
    private lazy var thirdButton: UIButton = {
        let btn = makeButton(title: "Нажми...")
        btn.addTarget(self, action: #selector(thirdButtonTap), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.configureUI()
    }
    
    func inject(with presenter: GeneralPresenterProtocol) {
        self.presenter = presenter
    }
}

private extension GeneralScreenViewController {
    
    func configureLabel() {
        view.addSubview(welcomeLabel)
        
        welcomeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(100)
            $0.leading.equalToSuperview().offset(70)
            $0.trailing.equalToSuperview().inset(70)
        }
    }
    
    func configureImageView() {
        view.addSubview(pictureImageView)
        
        pictureImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(50)
            $0.leading.equalToSuperview().offset(70)
            $0.trailing.equalToSuperview().inset(70)
            $0.height.equalTo(300)
        }
    }
    
    func configureTextField() {
        view.addSubview(inputTextField)
        
        inputTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(pictureImageView.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(70)
            $0.trailing.equalToSuperview().inset(70)
        }
    }
    
    func configureButtons() {
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
        
        firstButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(inputTextField.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(70)
            $0.trailing.equalToSuperview().inset(70)
            $0.height.equalTo(50)
        }
        
        secondButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(firstButton.snp.bottom).offset(15)
            $0.width.equalTo(firstButton)
            $0.height.equalTo(firstButton)
        }
        
        thirdButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(secondButton.snp.bottom).offset(15)
            $0.width.equalTo(secondButton)
            $0.height.equalTo(secondButton)
        }
    }
}

private extension GeneralScreenViewController {
    func makeButton(title: String) -> UIButton {
        let btn = UIButton(frame: .zero)
        
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 25
        
        return btn
    }
}

private extension GeneralScreenViewController {
    @objc func firstButtonTap() {
        presenter?.changeBackroundColor()
    }
    
    @objc func secondButtonTap() {
        presenter?.changeLabelText(text: inputTextField.text)
    }
    
    @objc func thirdButtonTap() {
        presenter?.navigateToSecondScreen()
    }
}

extension GeneralScreenViewController: GeneralPresenterViewDelegate {
    func setupUI() {
        view.backgroundColor = .orange
        configureLabel()
        configureImageView()
        configureTextField()
        configureButtons()
    }
    
    func updateBackgroundColor() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) { [weak self] in
            guard let self = self else { return }
            switch self.view.backgroundColor {
                case UIColor.orange:
                    self.view.backgroundColor = .systemYellow
                    self.welcomeLabel.textColor = .black
                    self.inputTextField.textColor = .black
                    break
                    
                default:
                    self.view.backgroundColor = .orange
                    self.welcomeLabel.textColor = .white
                    self.inputTextField.textColor = .white
                    break
            }
        }
    }
    
    func updateLabelText(name: String) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) { [weak self] in
            self?.welcomeLabel.text = "Здравствуйте, \(name)!"
        }
    }
}
