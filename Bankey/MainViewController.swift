//
//  MainViewController.swift
//  Bankey
//
//  Created by Mason Kim on 2023/01/23.
//

import UIKit

final class MainViewController: UITabBarController {

    // MARK: - Properties

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupTabbar()
    }

    // MARK: - Actions


    // MARK: - Helpers

    private func setupViews() {
        let summaryVC = DummyViewController()
        let moneyVC = DummyViewController()
        let moreVC = DummyViewController()

        summaryVC.view.backgroundColor = .blue
        moneyVC.view.backgroundColor = .systemPurple
        moreVC.view.backgroundColor = .brown

        summaryVC.setTabBarImage(imageName: "list.dash.header.rectangle", title: "Summary")
        moneyVC.setTabBarImage(imageName: "arrow.left.arrow.right", title: "Money")
        moreVC.setTabBarImage(imageName: "ellipsis.circle", title: "More")

        let summaryNC = UINavigationController(rootViewController: summaryVC)
        let moneyNC = UINavigationController(rootViewController: moneyVC)
        let moreNC = UINavigationController(rootViewController: moreVC)

        summaryNC.navigationBar.barTintColor = appColor

        let tabBarList = [summaryNC, moneyNC, moreNC]
        viewControllers = tabBarList
    }

    private func setupTabbar() {
        tabBar.tintColor = appColor
        tabBar.isTranslucent = false

        // ✨TIP: 처음에 어떤 화면을 초기화면으로 할 지 선택 할 수 있음
//        selectedIndex = 1
    }
}
