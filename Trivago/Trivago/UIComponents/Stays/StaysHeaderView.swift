//
//  StaysHeaderView.swift
//  Trivago
//
//  Created by Harry on 07.03.22.
//

import UIKit

class StaysHeaderView: UIView {

  let logoImageView: UIImageView = {
    let view = UIImageView(image: UIImage.custom.logo)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.contentMode = .scaleAspectFit
    return view
  }()

  private let searchView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .blue
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureLayout()
  }

  private func configureLayout() {    
    addSubview(logoImageView)
    addSubview(searchView)
    
    let padding = 5.0
    NSLayoutConstraint.activate([
      logoImageView.topAnchor.constraint(equalTo: topAnchor),
      logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
      logoImageView.heightAnchor.constraint(equalToConstant: 50),
      
      searchView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: padding),
      searchView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
      searchView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
      searchView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding)
    ])
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
