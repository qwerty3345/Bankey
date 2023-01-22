//
//  LoginViewController.swift
//  Bankey
//
//  Created by Mason Kim on 2023/01/21.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Properties
    let loginView = LoginView()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.text = "Bankey"
        return label
    }()

    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title2)
        label.text = "Your premium source for all \n things banking!"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    let titleStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 8
        return stack
    }()

    // ✨TIP: 이렇게 계산 속성으로 처리하면 굉장히 편하다!
    var username: String? {
        return loginView.usernameTextField.text
    }

    var password: String? {
        return loginView.passwordTextField.text
    }

    let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Sign In", for: [])
        button.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        button.layer.cornerRadius = 5
        return button
    }()

    let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .systemRed
        label.numberOfLines = 0
        label.text = "Error Failure"
        label.isHidden = true
        return label
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureStyle()
        configureLayout()
    }


    // MARK: - Helpers
}

// MARK: - ConfigureUI
extension LoginViewController {
    func configureStyle() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        titleStackView.translatesAutoresizingMaskIntoConstraints = false
    }

    func configureLayout() {
        view.addSubview(titleStackView)
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(subtitleLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)

        // LoginView
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 2)
            ])

        // Button
        NSLayoutConstraint.activate([
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2)
            ])

        // Error Label
        NSLayoutConstraint.activate([
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 3)
        ])

        // Title StackView
        NSLayoutConstraint.activate([
            titleStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleStackView.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -24)
        ])

    }
}

// ✨TIP: 액션 부분은 extension 으로 따로 빼서 관리하면 깔끔함
// MARK: - Actions
extension LoginViewController {
    @objc func signInTapped() {
        errorMessageLabel.isHidden = false
        login()
    }

    private func login() {
        guard let username, let password else {
            // ✨TIP: debug 빌드에서는 fatal error를 내고, release 빌드(프로덕션 빌드)에서는 무시됨.
            assertionFailure("username / password 은 nil이 되면 안됨")
            return
        }

        if username.isEmpty || password.isEmpty {
            configureErrorLabel(withMessage: "Username / Password 가 비어있습니다.")
            return
        }

        if username.lowercased() == "mason" && password == "12345678" {
            // ✨TIP: 버튼의 로딩 인디케이터를 추가할 수 있음 (iOS 15 이상 적용)
            if #available(iOS 15.0, *) {
                // ✨TIP: indicator 를 위한 configuration
                signInButton.configuration = .filled()
                signInButton.configuration?.imagePadding = 8
                signInButton.configuration?.showsActivityIndicator = true
            }
        } else {
            configureErrorLabel(withMessage: "유저네임, 패스워드가 일치하지 않습니다.")
            return
        }

    }

    private func configureErrorLabel(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
