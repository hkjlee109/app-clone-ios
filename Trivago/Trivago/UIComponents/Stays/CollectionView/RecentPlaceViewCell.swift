//
//  RecentPlaceViewCell.swift
//  Trivago
//
//  Created by Harry on 08.03.22.
//

import UIKit

class RecentPlaceViewCell: UICollectionViewCell {
  
  static let reuseIdentifier = "RecentPlaceViewCell"
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  private func configure() {
    backgroundColor = .green
    layer.cornerRadius = 8
//    symbol.translatesAutoresizingMaskIntoConstraints  = false
//    title.translatesAutoresizingMaskIntoConstraints   = false
//
//    symbol.tintColor = .darkGray
//
//    addSubview(symbol)
//    addSubview(title)
//
//    NSLayoutConstraint.activate([
//      symbol.topAnchor.constraint(equalTo: topAnchor),
//      symbol.centerXAnchor.constraint(equalTo: centerXAnchor),
//      symbol.widthAnchor.constraint(equalToConstant: 60),
//      symbol.heightAnchor.constraint(equalToConstant: 60),
//
//      title.topAnchor.constraint(equalTo: symbol.bottomAnchor, constant: 5),
//      title.centerXAnchor.constraint(equalTo: symbol.centerXAnchor),
//    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
