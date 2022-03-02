//
//  PopCoordinatable.swift
//  Trivago
//
//  Created by Harry on 02.03.22.
//

import Foundation

protocol PopCoordinatable: AnyObject {
  
  func popViewController()
  func popToRootViewController()
  
}
