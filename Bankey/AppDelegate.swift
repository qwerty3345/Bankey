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

    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground

        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self

        // ✨TIP: 루트 뷰컨트롤러 설정
        window?.rootViewController = loginViewController

        return true
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        setRootViewController(onboardingContainerViewController)
    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        print("DEBUG: Onboarding Closed!")
    }
}

extension AppDelegate {
    // ✨TIP: 루트뷰컨트롤러 변경시 애니메이션을 부여하기 위한 함수!
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }

        window.rootViewController = vc
        window.makeKeyAndVisible()
        // ✨TIP: 애니메이션 부여
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil)
    }
}
