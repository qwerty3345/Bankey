//
//  AccountSummaryCell.swift
//  Bankey
//
//  Created by Mason Kim on 2023/01/29.
//

import UIKit

class AccountSummaryCell: UITableViewCell {

    enum AccountType: String {
        case banking = "은행"
        case creditCard = "신용카드"
        case investment = "투자"
    }

    struct ViewModel {
        let accountType: AccountType
        let accountName: String
        let balance: Decimal

        var balanceAsAttributedString: NSAttributedString {
            CurrencyFormatter.makeAttributedCurrency(balance)
        }
    }

    // MARK: - Properties

    // ✨TIP: 네트워킹으로 비동기적으로 받아올 것이기에,
    // init에서 받아오지 않고 nil 을 초기값으로 두었다가 초기화하는 방식으로 구현!
    var viewModel: ViewModel? = nil

    private let typeLabel = UILabel()
    private let underlineView = UIView()
    private let nameLabel = UILabel()

    private let balanceLabel = UILabel()
    private let balanceAmountLabel = UILabel()
    private let balanceStackView = UIStackView()

    private let chevronImageView = UIImageView()

    static let reuseIdentifier = "AccountSummaryCell"
    static let rowHeight: CGFloat = 112

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
        balanceLabel.textAlignment = .right

        balanceAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceAmountLabel.font = .preferredFont(forTextStyle: .body)
        balanceAmountLabel.adjustsFontForContentSizeCategory = true
        // ✨TIP: attributedText 를 NSAttributedString 으로 설정 해 줌으로서 커스텀!
        balanceAmountLabel.attributedText = makeFormattedBalance(dollors: "XXX,XXX", cents: "XX")

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

    // ✨TIP: 잔고 금액을 표시할 때, 스트링 설정값을 다르게 주기 위한 함수
    private func makeFormattedBalance(dollors: String, cents: String) -> NSMutableAttributedString {
        // ✨TIP: 각 단위별로 스타일을 다르게 줌 (달러사인, 달러, 센트)
        let dollarSignAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8]
        let dollarAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title1)]
        let centAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .footnote), .baselineOffset: 8]

        // ✨TIP: 첫 시작 rootString 은 Mutable 으로서 다른 AttrString을 추가할 수 있게 함!
        let rootString = NSMutableAttributedString(string: "$", attributes: dollarSignAttributes)
        let dollarString = NSMutableAttributedString(string: dollors, attributes: dollarAttributes)
        let centString = NSMutableAttributedString(string: cents, attributes: centAttributes)

        rootString.append(dollarString)
        rootString.append(centString)

        return rootString
    }
}

// MARK: - ViewModel Configuration
extension AccountSummaryCell {
    // ✨TIP: ViewModel을 바탕으로 cell 정보를 설정
    func configure(with viewModel: ViewModel) {
        typeLabel.text = viewModel.accountType.rawValue
        nameLabel.text = viewModel.accountName
        balanceAmountLabel.attributedText = viewModel.balanceAsAttributedString

        switch viewModel.accountType {
        case .banking:
            underlineView.backgroundColor = appColor
            balanceLabel.text = "현재 잔고"
        case .creditCard:
            underlineView.backgroundColor = .systemOrange
            balanceLabel.text = "사용액"
        case .investment:
            underlineView.backgroundColor = .systemPurple
            balanceLabel.text = "평가금액"
        }
    }
}
