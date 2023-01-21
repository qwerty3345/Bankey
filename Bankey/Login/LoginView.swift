//
//  LoginView.swift
//  Bankey
//
//  Created by Mason Kim on 2023/01/21.
//

import UIKit

class LoginView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureStyle()
        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}

extension LoginView {
    func configureStyle() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .orange
    }

    func configureLayout() {

    }
}

