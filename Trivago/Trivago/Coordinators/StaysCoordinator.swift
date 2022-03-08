//
//  StaysCoordinator.swift
//  Trivago
//
//  Created by Harry on 02.03.22.
//

import UIKit

class StaysCoordinator: NSObject, Coordinatable {
  
  typealias Factory = CoordinatorFactory & ViewFactory
  
  let factory : Factory
  var navigationController : UINavigationController

  init(factory: Factory,
       navigationController: UINavigationController) {
    self.factory = factory
    self.navigationController = navigationController
  }
  
  func start() {
    let viewController = factory.makeStaysView()
    viewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "envelope")!, selectedImage: UIImage.custom.stays)
    navigationController.pushViewController(viewController, animated: false)
  }
  
}

extension StaysCoordinator: PopCoordinatable {
  
  func popViewController() {
    DispatchQueue.main.async {
      self.navigationController.popViewController(animated: true)
    }
  }
  
  func popToRootViewController() {}
  
}
