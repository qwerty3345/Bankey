//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by Mason Kim on 2023/01/23.
//

import UIKit

final class OnboardingViewController: UIViewController {

    // MARK: - Properties
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .center
        return stack
    }()

    let heroImageName: String
    let heroImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "delorean")
        iv.contentMode = .scaleAspectFit
        return iv
    }()

    let titleText: String
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()


    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    init(heroImageName: String, titleText: String) {
        self.heroImageName = heroImageName
        self.titleText = titleText
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Actions


    // MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .white

        stackView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        heroImageView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)
        stackView.addArrangedSubview(heroImageView)
        stackView.addArrangedSubview(titleLabel)

        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])

        heroImageView.image = UIImage(named: heroImageName)
        titleLabel.text = titleText
    }
}
