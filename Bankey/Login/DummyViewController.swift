//
//  DummyViewController.swift
//  Bankey
//
//  Created by Mason Kim on 2023/01/23.
//

import UIKit

final class DummyViewController: UIViewController {

    // MARK: - Properties
    weak var logoutDelegate: LogoutDelegate?

    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .center
        stack.distribution = .fillEqually
        return stack
    }()

    let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그아웃", for: .normal)
        button.addTarget(self, action: #selector(tappedLogoutButton), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    // MARK: - Actions
    @objc func tappedLogoutButton(sender: UIButton) {
        logoutDelegate?.didLogout()
    }

    // MARK: - Helpers
    func configureUI() {
        view.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.translatesAutoresizingMaskIntoConstraints = false

        stackView.addArrangedSubview(logoutButton)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

