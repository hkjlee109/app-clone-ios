//
//  AppMainCoordinator.swift
//  Trivago
//
//  Created by Harry on 02.03.22.
//

import UIKit

class AppMainCoordinator: Coordinatable {

  typealias Factory = ViewFactory & CoordinatorFactory
  let factory: Factory
  
  var navigationController: UINavigationController
  var children: [Coordinatable] = []

  let window: UIWindow
  
  init(factory: Factory,
       window: UIWindow,
       navigationController: UINavigationController = UINavigationController()) {
    self.factory                = factory
    self.window                 = window
    self.navigationController   = navigationController
  }
  
  func start() {
    let viewController = factory.makeMainTabBar()
    window.rootViewController = viewController
    window.makeKeyAndVisible()
  }
}
