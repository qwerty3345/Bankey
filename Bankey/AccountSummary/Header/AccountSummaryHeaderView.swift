//
//  AccountSummaryHeaderView.swift
//  Bankey
//
//  Created by Mason Kim on 2023/01/24.
//

import UIKit

final class AccountSummaryHeaderView: UIView {
    @IBOutlet var contentView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        // ✨TIP: UIView.noIntrinsicMetric: 고유 사이즈를 없게 설정! (여기선 가로만)
        return CGSize(width: UIView.noIntrinsicMetric, height: 144)
    }

    private func commonInit() {
        let bundle = Bundle(for: AccountSummaryHeaderView.self)
        bundle.loadNibNamed("AccountSummaryHeaderView", owner: self)

        addSubview(contentView)
        contentView.backgroundColor = appColor

        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
