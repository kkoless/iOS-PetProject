//
//  AuthorizationFormView.swift
//  PetProject
//
//  Created by Кирилл Колесников on 06.03.2022.
//

import UIKit
import SnapKit


final class AuthorizationFormView: UIView {
    var loginButtonTapAction: ((String, GenderType, Int) -> ())?

    private lazy var inputNameLabel: UILabel = { makeLabel(title: "Введите имя") }()
    private lazy var nameTextField: UITextField = {
        makeTextField(placeholderText: "Как можно к вам обращаться?")
    }()
    
    private lazy var nameStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [inputNameLabel, nameTextField])
        stack.axis = .vertical
        stack.setCustomSpacing(8, after: inputNameLabel)
        return stack
    }()
    
    private lazy var ageLabel: UILabel = { makeLabel(title: "Укажите возраст") }()
    private lazy var ageTextField: UITextField = {
        makeTextField(placeholderText: "Сколько вам лет?", keyboardType: .numberPad)
    }()
    
    private lazy var ageStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [ageLabel, ageTextField])
        stack.axis = .vertical
        stack.setCustomSpacing(8, after: ageLabel)
        return stack
    }()
    
    private lazy var genderLabel: UILabel = { makeLabel(title: "Укажите пол") }()
    private lazy var genderSegmentedControl: UISegmentedControl = {
        let items = [GenderType.male.rawValue, GenderType.female.rawValue]
        let sc = UISegmentedControl(items: items)
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    private lazy var genderStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [genderLabel, genderSegmentedControl])
        stack.axis = .vertical
        stack.setCustomSpacing(8, after: genderLabel)
        return stack
    }()
    
    private lazy var loginButton: UIButton = {
        let btn = UIButton(frame: .zero)
        btn.setTitle("Войти", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 25
        btn.addTarget(self, action: #selector(loginButtonTap), for: .touchUpInside)
        return btn
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension AuthorizationFormView {
    func configureUI() {
        backgroundColor = .white
        configureNameStackView()
        configureAgeStackView()
        configureSegmentedControl()
        configureButton()
    }
    
    func configureNameStackView() {
        addSubview(nameStackView)
        
        nameTextField.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        
        nameStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        setTextFieldPadding(nameTextField)
    }
    
    func configureAgeStackView() {
        addSubview(ageStackView)
        
        ageTextField.snp.makeConstraints {
            $0.height.equalTo(nameTextField)
        }

        ageStackView.snp.makeConstraints {
            $0.top.equalTo(nameStackView.snp.bottom).offset(25)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        setTextFieldPadding(ageTextField)
    }
    
    func configureSegmentedControl() {
        addSubview(genderStackView)

        genderStackView.snp.makeConstraints {
            $0.top.equalTo(ageStackView.snp.bottom).offset(25)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
    }

    func configureButton() {
        addSubview(loginButton)

        loginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(100)
            $0.height.equalTo(50)
            $0.leading.equalToSuperview().offset(70)
            $0.trailing.equalToSuperview().inset(70)
        }
    }
}

private extension AuthorizationFormView {
    @objc func loginButtonTap() {
        let gender: GenderType = genderSegmentedControl.selectedSegmentIndex == 0 ? .male : .female
        guard var name = nameTextField.text, let age = Int(ageTextField.text ?? "0") else { return }
        name = name.trimmingCharacters(in: .whitespacesAndNewlines)
        let ageCondition = age != 0 && age <= 110
        if !name.isEmpty && ageCondition {
            loginButtonTapAction?(name, gender, age)
        }
    }
}

private extension AuthorizationFormView {
    func makeLabel(title: String) -> UILabel {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.text = title
        label.textColor = .black
        return label
    }
    
    func makeTextField(placeholderText: String? = nil,
                       keyboardType: UIKeyboardType? = nil) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        textField.placeholder = placeholderText
        textField.keyboardType = keyboardType ?? .default
        textField.textColor = .black
        textField.layer.borderWidth = 1
        textField.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        textField.layer.cornerRadius = 15
        return textField
    }
    
    func setTextFieldPadding(_ textField: UITextField) {
        let paddingView: UIView = UIView(frame: CGRect(x: 0,
                                                       y: 0,
                                                       width: 15,
                                                       height: textField.frame.height)
        )
        textField.leftView = paddingView
        textField.leftViewMode = .always
    }
}
