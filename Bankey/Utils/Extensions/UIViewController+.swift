//
//  UIViewController+.swift
//  Bankey
//
//  Created by Mason Kim on 2023/01/23.
//

import UIKit

extension UIViewController {
    // ✨TIP: statusBar 를 설정하기 위한 메서드
    func setStatusBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = appColor
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        // ✨TIP: 이 설정을 하면 status bar 하단에 선이 생김...
//        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    }

    func setTabBarImage(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)   // TODO: tag가 왜 고정??
    }
}
