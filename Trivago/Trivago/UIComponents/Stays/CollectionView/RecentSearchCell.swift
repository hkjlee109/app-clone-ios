//
//  RecentSearchCell.swift
//  Trivago
//
//  Created by Harry on 08.03.22.
//

import UIKit

struct RecentSearchData {
  var image: UIImage?
  var name: String?
  var checkInDate: Date?
  var checkOutDate: Date?
}


class RecentSearchCell: UICollectionViewCell {
  
  static let reuseIdentifier = "RecentSearchCell"
  
  var data: RecentSearchData? //{
//    didSet {
//      symbol.image  = item?.image
//      title.text    = item?.text
//    }
//  }
  
//  private let symbol = UIImageView()
//  private let title  = HeaderLabel(font: CustomUIFonts.caption, textAlignment: .center)
//
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  private func configure() {
    backgroundColor = .white
    layer.cornerRadius = 8
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowRadius = 1.0
    layer.shadowOpacity = 0.1
    layer.shadowOffset = CGSize(width: 0, height: 1)
    
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
