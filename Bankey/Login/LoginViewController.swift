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


    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureStyle()
        configureLayout()
    }

    // MARK: - Actions


    // MARK: - Helpers
}

// MARK: - ConfigureUI
extension LoginViewController {
    func configureStyle() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
    }

    func configureLayout() {
        view.addSubview(loginView)

        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
            
        ])
    }
}
