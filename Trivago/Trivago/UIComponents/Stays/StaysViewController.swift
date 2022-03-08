//
//  StaysViewController.swift
//  Trivago
//
//  Created by Harry on 02.03.22.
//

import UIKit

class StaysViewController: UIViewController {
  
  static let sectionHeaderElementKind = "section-header-element-kind"
  
  enum Section: CaseIterable {
    case recentSearches
    case recentPlaceViews
    case nearbyHotelSearch
  }
  
  private let headerView = StaysHeaderView()
  private var headerViewTopConstraint: NSLayoutConstraint?
  private var headerViewHeightConstraint: NSLayoutConstraint?
  
  private var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.custom.background
    
    configureCollectionView()
    configureLayout()
  }
  
  private func configureCollectionView() {
    let layout = UICollectionViewCompositionalLayout { section, env in
      switch(Section.allCases[section]) {
      case .recentSearches:
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.40), heightDimension: .absolute(120))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 10, trailing: 5)
        
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
          layoutSize: sectionHeaderSize,
          elementKind: StaysViewController.sectionHeaderElementKind, alignment: .top)

        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .continuous
        
        return section
      case .recentPlaceViews:
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.6), heightDimension: .absolute(120))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 10, trailing: 5)
        
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
          layoutSize: sectionHeaderSize,
          elementKind: StaysViewController.sectionHeaderElementKind, alignment: .top)

        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
        
      case .nearbyHotelSearch:
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(370))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 10, trailing: 5)
        
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(70))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
          layoutSize: sectionHeaderSize,
          elementKind: StaysViewController.sectionHeaderElementKind, alignment: .top)

        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
      }
    }
    
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.backgroundColor = .clear

    collectionView.register(RecentSearchCell.self, forCellWithReuseIdentifier: RecentSearchCell.reuseIdentifier)
    collectionView.register(RecentPlaceViewCell.self, forCellWithReuseIdentifier: RecentPlaceViewCell.reuseIdentifier)
    collectionView.register(NearbyHotelSearchCell.self, forCellWithReuseIdentifier: NearbyHotelSearchCell.reuseIdentifier)
    collectionView.register(TextHeaderCollectionReusableView.self,
                            forSupplementaryViewOfKind: StaysViewController.sectionHeaderElementKind,
                            withReuseIdentifier: TextHeaderCollectionReusableView.reuseIdentifier)
    
    collectionView.showsVerticalScrollIndicator = false
  }
  
  private func configureDataSource() {
  }

  private func configureLayout() {
    headerView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    view.addSubview(headerView)
    view.addSubview(collectionView)
    
    headerViewTopConstraint = headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
    headerViewHeightConstraint = headerView.heightAnchor.constraint(equalToConstant: 200)
    
    NSLayoutConstraint.activate([
      headerViewTopConstraint!,
      headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      headerViewHeightConstraint!,
      
      collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }

}

extension StaysViewController: UICollectionViewDelegate {
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let y = scrollView.contentOffset.y
    print(y)
    
    let swipingDown = y <= 0
    let shouldSnap = y > 30
    let logoHeight = headerView.logoImageView.frame.height
    
    UIView.animate(withDuration: 0.3) {
      self.headerView.logoImageView.alpha = swipingDown ? 1.0 : 0.0
    }
    
    UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: []) {
      self.headerViewTopConstraint?.constant = shouldSnap ? -logoHeight - 30 : 0
      self.headerViewHeightConstraint?.constant = shouldSnap ? 120 : 200
      self.view.layoutIfNeeded()
    }
  }
  
}

extension StaysViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch(Section.allCases[indexPath.section]) {
    case .recentSearches:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentSearchCell.reuseIdentifier, for: indexPath) as! RecentSearchCell
//      cell.viewModel = viewModel.myProfileCellViewModel
      return cell
    case .recentPlaceViews:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentPlaceViewCell.reuseIdentifier, for: indexPath) as! RecentPlaceViewCell
//      cell.viewModel = viewModel.myProfileCellViewModel
      return cell
    case .nearbyHotelSearch:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NearbyHotelSearchCell.reuseIdentifier, for: indexPath) as! NearbyHotelSearchCell
//      cell.viewModel = viewModel.myProfileCellViewModel
      return cell
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    switch(Section.allCases[section]) {
    case .recentSearches:
      return 5
    case .recentPlaceViews:
      return 4
    case .nearbyHotelSearch:
      return 1
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TextHeaderCollectionReusableView.reuseIdentifier, for: indexPath) as! TextHeaderCollectionReusableView
    
    switch(Section.allCases[indexPath.section]) {
    case .recentSearches:
      header.text = "RECENT SEARCHES"
    case .recentPlaceViews:
      header.text = "PLACE YOU REZCENTLY VIEWED"
    case .nearbyHotelSearch:
      header.text = "Looking for a hotel nearby tonight?"
      header.fontSize = 32
    }
    
    return header
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return Section.allCases.count
  }
}
