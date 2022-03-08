//
//  TextHeaderCollectionReusableView.swift
//  Trivago
//
//  Created by Harry on 08.03.22.
//

import UIKit

class TextHeaderCollectionReusableView: UICollectionReusableView {
  
  static let reuseIdentifier = "TextHeaderCollectionReusableView"
  
  private let label = UILabel()
  private let defaultFontSize = 14.0
  
  var text: String? {
    didSet {
      label.text = text
    }
  }
  
  var fontSize: CGFloat? {
    didSet {
      label.font = .boldSystemFont(ofSize: fontSize ?? defaultFontSize)
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    label.translatesAutoresizingMaskIntoConstraints = false
    label.lineBreakMode = .byWordWrapping
    label.numberOfLines = 0
    label.font = .boldSystemFont(ofSize: defaultFontSize)
    
    addSubview(label)
    
    let padding = 10.0

    NSLayoutConstraint.activate([
      label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
      label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
      label.topAnchor.constraint(equalTo: topAnchor, constant: padding),
      label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding)
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("inidt(coder:) has not been implemented")
  }
  
  //    override func layoutSubviews() {
  //        super.layoutSubviews()
  //        label.frame = bounds.insetBy(dx: 0, dy: 0)
  //    }
}
