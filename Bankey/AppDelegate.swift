//
//  AppDelegate.swift
//  Bankey
//
//  Created by Mason Kim on 2023/01/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        // ✨TIP: 루트 뷰컨트롤러 설정
        window?.rootViewController = LoginViewController()

        return true
    }
}

