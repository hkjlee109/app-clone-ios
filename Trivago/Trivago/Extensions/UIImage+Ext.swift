//
//  UIImage+Ext.swift
//  Trivago
//
//  Created by Harry on 03.03.22.
//

import UIKit

extension UIImage {
  
  static let custom = CustomUIImage()
  
}

struct CustomUIImage {
  
  let logo = UIImage(named: "Logo")!
  let searchNearbyHotels = UIImage(named: "SearchNearbyHotels")!
  let createAccount = UIImage(named: "CreateAccount")!
  
  let stays = UIImage(systemName: "lock")!

}
