//
//  AccountSummaryCell.swift
//  Bankey
//
//  Created by Mason Kim on 2023/01/29.
//

import UIKit

class AccountSummaryCell: UITableViewCell {

    // MARK: - Properties
    private let typeLabel = UILabel()
    private let underlineView = UIView()
    private let nameLabel = UILabel()

    private let balanceLabel = UILabel()
    private let balanceAmountLabel = UILabel()
    private let balanceStackView = UIStackView()

    private let chevronImageView = UIImageView()

    static let reuseIdentifier = "AccountSummaryCell"
    static let rowHeight: CGFloat = 100

    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setup()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Helpers
    private func setup() {
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = .preferredFont(forTextStyle: .caption1)
        typeLabel.adjustsFontForContentSizeCategory = true
        typeLabel.text = "계좌 종류"
        contentView.addSubview(typeLabel)

        underlineView.translatesAutoresizingMaskIntoConstraints = false
        underlineView.backgroundColor = appColor
        contentView.addSubview(underlineView)

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .preferredFont(forTextStyle: .body)
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.text = "계좌 이름"
        contentView.addSubview(nameLabel)

        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.font = .preferredFont(forTextStyle: .body)
        balanceLabel.adjustsFontForContentSizeCategory = true
        balanceLabel.text = "계좌 잔고"

        balanceAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceAmountLabel.font = .preferredFont(forTextStyle: .body)
        balanceAmountLabel.adjustsFontForContentSizeCategory = true
        balanceAmountLabel.text = "$999,999,999.99"

        balanceStackView.translatesAutoresizingMaskIntoConstraints = false
        balanceStackView.axis = .vertical
        balanceStackView.spacing = 0
        balanceStackView.addArrangedSubview(balanceLabel)
        balanceStackView.addArrangedSubview(balanceAmountLabel)
        contentView.addSubview(balanceStackView)

        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        chevronImageView.image = UIImage(systemName: "chevron.right")
        chevronImageView.tintColor = appColor
        contentView.addSubview(chevronImageView)
    }

    private func layout() {
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),

            underlineView.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 1),
            underlineView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            underlineView.widthAnchor.constraint(equalToConstant: 60),
            underlineView.heightAnchor.constraint(equalToConstant: 4),

            nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 2),
            nameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),

            balanceStackView.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: balanceStackView.trailingAnchor, multiplier: 4),

            chevronImageView.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: chevronImageView.trailingAnchor, multiplier: 1),

        ])
    }
}
