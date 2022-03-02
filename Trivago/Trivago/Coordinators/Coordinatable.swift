//
//  Coordinatable.swift
//  Trivago
//
//  Created by Harry on 02.03.22.
//

import UIKit

protocol Coordinatable: AnyObject {
  
  var navigationController: UINavigationController { get set }
  func start()
  
}
