//
//  OnboardingContainerViewController.swift
//  Bankey
//
//  Created by Mason Kim on 2023/01/22.
//

import UIKit

protocol OnboardingContainerViewControllerDelegate: AnyObject {
    func didFinishOnboarding()
}

final class OnboardingContainerViewController: UIViewController {

    // MARK: - Properties
    weak var delegate: OnboardingContainerViewControllerDelegate?

    let pageViewController: UIPageViewController
    var pages = [UIViewController]()
    var currentVC: UIViewController
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("닫기", for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .title3)
        button.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)

        let page1 = OnboardingViewController(heroImageName: "delorean", titleText: "Bankey 앱은 빠르고 사용하기 좋은 앱입니다.\n또한 레트로 풍의 블라블라...\n블라블라 설명...")
        let page2 = OnboardingViewController(heroImageName: "world", titleText: "Bankey 앱은 빠르고 사용하기 좋은 앱입니다.\n또한 레트로 풍의 블라블라...\n블라블라 설명...")
        let page3 = OnboardingViewController(heroImageName: "thumbs", titleText: "Bankey 앱은 빠르고 사용하기 좋은 앱입니다.\n또한 레트로 풍의 블라블라...\n블라블라 설명...")

        pages.append(page1)
        pages.append(page2)
        pages.append(page3)

        currentVC = pages.first!

        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configurePageViewUI()
        configureButtonUI()
    }

    // MARK: - Helpers
    private func configurePageViewUI() {
        view.backgroundColor = .systemPurple

        // ✨TIP: "부모" 뷰 컨트롤러에 "자식" 뷰 컨트롤러를 추가함 (아래 3줄!)
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)  // ✨ 자식에게도 부모를 추가해줌

        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: false)
        currentVC = pages.first!

        pageViewController.dataSource = self
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func configureButtonUI() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            closeButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
        ])
    }

    // MARK: - Actions
    @objc func tappedCloseButton() {
        delegate?.didFinishOnboarding()
    }

}

// MARK: - UIPageViewControllerDataSource
extension OnboardingContainerViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getPreviousViewController(from: viewController)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return getNextViewController(from: viewController)
    }

    private func getPreviousViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index - 1 >= 0 else { return nil }
        currentVC = pages[index - 1]
        return pages[index - 1]
    }

    private func getNextViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index + 1 < pages.count else { return nil }
        currentVC = pages[index + 1]
        return pages[index + 1]
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pages.firstIndex(of: self.currentVC) ?? 0
    }

}
