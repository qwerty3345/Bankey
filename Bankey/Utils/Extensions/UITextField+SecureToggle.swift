//
//  UITextField+SecureToggle.swift
//  Bankey
//
//  Created by Mason Kim on 2023/02/20.
//

import UIKit

let passwordToggleButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
    button.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
    return button
}()

extension UITextField {
    func enablePasswordToggle() {
        passwordToggleButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        rightView = passwordToggleButton
        rightViewMode = .always
    }

    @objc func togglePasswordView(_ sender: Any) {
        isSecureTextEntry.toggle()
        passwordToggleButton.isSelected.toggle()
    }
}
