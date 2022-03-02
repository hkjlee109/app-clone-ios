//
//  CompositionRoot+ViewFactory.swift
//  Trivago
//
//  Created by Harry on 02.03.22.
//

import Foundation
import UIKit

protocol ViewFactory {
  
  func makeMainTabBar() -> MainTabBarController
  func makeStaysView() -> StaysViewController
  
}

extension CompositionRoot: ViewFactory {
  
  func makeMainTabBar() -> MainTabBarController {
    return MainTabBarController(factory: self)
  }
  
  func makeStaysView() -> StaysViewController {
    return StaysViewController()
  }
  
}
