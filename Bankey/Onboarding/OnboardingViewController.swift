//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by Mason Kim on 2023/01/23.
//

import UIKit

class OnboardingViewController: UIViewController {

    // MARK: - Properties
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .center
        stack.backgroundColor = .systemPurple
        return stack
    }()

    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "delorean")
        iv.contentMode = .scaleAspectFit
        return iv
    }()

    let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.text = """
                    Bankey 앱은 빠르고 사용하기 좋은 앱입니다.
                    또한 레트로 풍의 블라블라...
                    블라블라 설명...
                    """
        return label
    }()


    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    // MARK: - Actions


    // MARK: - Helpers
    func configureUI() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)

        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])

    }
}
