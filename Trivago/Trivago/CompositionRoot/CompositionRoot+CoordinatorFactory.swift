//
//  CompositionRoot+CoordinatorFactory.swift
//  Trivago
//
//  Created by Harry on 02.03.22.
//

import UIKit

protocol CoordinatorFactory {
  
  func makeStaysCoordinator() -> StaysCoordinator
  
}

extension CompositionRoot: CoordinatorFactory {

  func makeStaysCoordinator() -> StaysCoordinator {
    return StaysCoordinator(factory: self, navigationController: UINavigationController())
  }
  
}
