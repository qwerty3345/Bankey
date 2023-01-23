//
//  LoginView.swift
//  Bankey
//
//  Created by Mason Kim on 2023/01/21.
//

import UIKit

final class LoginView: UIView {

    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()

    let usernameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Username"
        return tf
    }()

    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        return tf
    }()

    let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemFill
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureStyle()
        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView {
    func configureStyle() {
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 5
        clipsToBounds = true

        translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.translatesAutoresizingMaskIntoConstraints = false

        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }

    func configureLayout() {
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTextField)
        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),

            dividerView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            return false
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {

    }
}
