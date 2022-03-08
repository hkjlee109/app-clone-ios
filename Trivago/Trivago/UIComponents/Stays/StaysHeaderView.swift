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
    
    NSLayoutConstraint.activate([
      logoImageView.topAnchor.constraint(equalTo: topAnchor),
      logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
      logoImageView.heightAnchor.constraint(equalToConstant: 50),
      
      searchView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor),
      searchView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      searchView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
      searchView.heightAnchor.constraint(equalToConstant: 100),
    ])
    
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
