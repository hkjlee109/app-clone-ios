//
//  NearbyHotelSearchCell.swift
//  Trivago
//
//  Created by Harry on 08.03.22.
//

import UIKit

class NearbyHotelSearchCell: UICollectionViewCell {
  
  static let reuseIdentifier = "NearbyHotelSearchCell"
  
  private let backgroundImageView: UIImageView = {
    let view = UIImageView(image: UIImage.custom.searchNearbyHotels)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.contentMode = .scaleAspectFill
    view.layer.cornerRadius = 8
    view.clipsToBounds = true
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  private func configure() {
    addSubview(backgroundImageView)
    
    NSLayoutConstraint.activate([
      backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
      backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
      backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
      backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
