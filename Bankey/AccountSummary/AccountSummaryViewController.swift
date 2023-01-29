//
//  AccountSummaryViewController.swift
//  Bankey
//
//  Created by Mason Kim on 2023/01/24.
//

import UIKit
import UIKit

final class AccountSummaryViewController: UIViewController {

    // MARK: - Properties
    var accountViewModels: [AccountSummaryCell.ViewModel] = [] {
        didSet {
            // ✨TIP: tableView reloadData 에 애니메이션 부여
            UIView.transition(with: tableView, duration: 0.3, options: .transitionCrossDissolve) {
                self.tableView.reloadData()
            }
        }
    }
    var tableView = UITableView()

    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .center
        stack.distribution = .fillEqually
        return stack
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        fetchData()
    }

    // MARK: - Actions


    // MARK: - Helpers
    private func configureUI() {
        setupTableView()
        setupTableHeaderView()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(AccountSummaryCell.self, forCellReuseIdentifier: AccountSummaryCell.reuseIdentifier)
        tableView.rowHeight = AccountSummaryCell.rowHeight
        tableView.tableFooterView = UIView()

        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func setupTableHeaderView() {
        let headerView = AccountSummaryHeaderView(frame: .zero)

        // ✨TIP: Header 사이즈가 설정됨 (최소 사이즈로 - Intrinsic Size)
        var size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        // ✨TIP: width 가 꽉차게 설정됨
        size.width = view.frame.width
        headerView.frame.size = size

        tableView.tableHeaderView = headerView
    }
}

// MARK: - UITableViewDataSource
extension AccountSummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !accountViewModels.isEmpty,
              let accountViewModel = accountViewModels[safe: indexPath.row],
              let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.reuseIdentifier, for: indexPath) as? AccountSummaryCell else {
            return UITableViewCell()
        }

        cell.configure(with: accountViewModel)

        return cell
    }
}

// MARK: - UITableViewDelegate
extension AccountSummaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

// MARK: - Data
extension AccountSummaryViewController {
    private func fetchData() {
        let savings = AccountSummaryCell.ViewModel(accountType: .banking,
                                                   accountName: "기본 계좌",
                                                   balance: 929466.23)
        let chequing = AccountSummaryCell.ViewModel(accountType: .banking,
                                                    accountName: "No-Fee All-In Chequing",
                                                    balance: 17562.44)
        let wooriCard = AccountSummaryCell.ViewModel(accountType: .creditCard,
                                                accountName: "우리카드",
                                                balance: 412.83)
        let masterCard = AccountSummaryCell.ViewModel(accountType: .creditCard,
                                                      accountName: "학생용 마스터카드",
                                                      balance: 50.83)
        let investment1 = AccountSummaryCell.ViewModel(accountType: .investment,
                                                       accountName: "Tax-Free 투자",
                                                       balance: 2000.00)
        let investment2 = AccountSummaryCell.ViewModel(accountType: .investment,
                                                       accountName: "Growth Fund",
                                                       balance: 15000.00)

        // 네트워킹 환경 재현 (0.5초, 1초, 1.5초 후에 데이터 받아와짐)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            self.accountViewModels.append(savings)
            self.accountViewModels.append(chequing)

        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.accountViewModels.append(wooriCard)
            self.accountViewModels.append(masterCard)

        }

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            self.accountViewModels.append(investment1)
            self.accountViewModels.append(investment2)
        }

    }
}
