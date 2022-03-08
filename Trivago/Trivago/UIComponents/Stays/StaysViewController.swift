//
//  StaysViewController.swift
//  Trivago
//
//  Created by Harry on 02.03.22.
//

import UIKit

class StaysViewController: UIViewController {

  private let headerView = StaysHeaderView()
  private var headerViewTopConstraint: NSLayoutConstraint?
  
  private var collectionView: UICollectionView!
  
  let cellId = "cellId"
  let tiles = [
    "Item1",
    "Item2",
    "Item3",
    "Item4",
    "Item5"
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureCollectionView()
    configureLayout()
  }
  
  private func configureCollectionView() {
    
//    let layout = UICollectionViewCompositionalLayout { sectionNumber, env in
//        if sectionNumber == 0 {
//            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(1)))
//            item.contentInsets = .init(top: 16, leading: 8, bottom: 16, trailing: 8)
//
//            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(150)), subitems: [item])
//            let section = NSCollectionLayoutSection(group: group)
//            section.orthogonalScrollingBehavior = .continuous
//
//            section.boundarySupplementaryItems = [
//                .init(layoutSize: .init(widthDimension: .fractionalHeight(1), heightDimension: .absolute(50)), elementKind: MatchesMessagesController.categoryHeaderId, alignment: .topLeading)
//            ]
//
//            return section
//        } else {
//            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100)))
//            item.contentInsets = .init(top: 8, leading: 8, bottom: 8, trailing: 8)
//
//            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500)), subitems: [item])
//            let section = NSCollectionLayoutSection(group: group)
//
//            section.boundarySupplementaryItems = [
//                .init(layoutSize: .init(widthDimension: .fractionalHeight(1), heightDimension: .absolute(50)), elementKind: MatchesMessagesController.categoryHeaderId, alignment: .topLeading)
//            ]
//
//            return section
//        }
//    }
//
//    super.init(collectionViewLayout: layout)
    
    let padding: CGFloat = 15
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    flowLayout.itemSize = CGSize(width: view.bounds.width - padding * 2, height: 400)
    
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.backgroundColor = .yellow
  }
  
  private func configureLayout() {
    headerView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    view.addSubview(headerView)
    view.addSubview(collectionView)
    
    headerViewTopConstraint = headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
    
    NSLayoutConstraint.activate([
      headerViewTopConstraint!,
      headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      headerView.heightAnchor.constraint(equalToConstant: 150),
      
      collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }

}

extension StaysViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    
    return cell
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return tiles.count
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
      self.headerViewTopConstraint?.constant = shouldSnap ? -logoHeight : 0
      self.view.layoutIfNeeded()
    }
  }
  
}
