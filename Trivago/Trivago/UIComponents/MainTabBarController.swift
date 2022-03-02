//
//  MainTabBarController.swift
//  Trivago
//
//  Created by Harry on 02.03.22.
//

import UIKit

class MainTabBarController: UITabBarController {
  
  typealias Factory = CoordinatorFactory & ViewFactory
  
  private let staysCoordinator: Coordinatable
  
  init(factory: Factory) {
    self.staysCoordinator = factory.makeStaysCoordinator()
    
    super.init(nibName: nil, bundle: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureTabBar()
    
    view.backgroundColor = .blue
    
    staysCoordinator.start()
    
    view.backgroundColor = .white
    viewControllers      = [ staysCoordinator.navigationController ]
  }

  func configureTabBar() {
//    tabBar.tintColor = UIColor.custom.secondaryColor
//    tabBar.unselectedItemTintColor = UIColor.custom.primaryColorLight2
//    tabBar.barTintColor = UIColor.custom.primaryColor
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
