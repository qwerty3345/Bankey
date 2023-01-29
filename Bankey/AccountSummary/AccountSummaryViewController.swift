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

    let games = [
        "Pacman",
        "Space Invadors",
        "Space Patrol"
    ]

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

// MARK: - UITableViewDelegate
extension AccountSummaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

// MARK: - UITableViewDataSource
extension AccountSummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = games[indexPath.row]
        return cell
    }
}
