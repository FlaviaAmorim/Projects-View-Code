//
//  TabBarController.swift
//  AboutMeCode
//
//  Created by flaviaamorim on 24/03/21.
//

import UIKit

class TabBarController: UITabBarController {
    
    // MARK: - Properties
    private let bioNavigationController = NavigationController(tabBarTitle: .bio)
    private let familyNavigationController = NavigationController(tabBarTitle: .family)
    private let hobbiesNavigtionController = NavigationController(tabBarTitle: .hobbies)

    override func viewDidLoad() {
        super.viewDidLoad()
        embedViewControllers()
    }
    
    private func embedViewControllers() {
        viewControllers = [
            bioNavigationController,
            familyNavigationController,
            hobbiesNavigtionController]
    }
}

  private final class NavigationController: UINavigationController {
    // MARK: - Initializers
    init(tabBarTitle: TabBarTitle) {
      let rootViewController: UIViewController
      switch tabBarTitle {
      case .bio:
        rootViewController = BioViewController()
        rootViewController.tabBarItem.image = UIImage(systemName: "person")
      case .family:
        rootViewController = FamilyViewController()
        rootViewController.tabBarItem.image = UIImage(named: "Icon-Small-1")
      case .hobbies:
        rootViewController = HobbiesViewController()
        rootViewController.tabBarItem.image = UIImage(named: "Icon-Small")
      }
      rootViewController.title = tabBarTitle.rawValue
      super.init(rootViewController: rootViewController)
      tabBarItem.title = tabBarTitle.rawValue
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
    }
}
