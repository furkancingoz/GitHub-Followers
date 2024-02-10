//
//  FollowersListVC.swift
//  GitHub Followers
//
//  Created by Furkan Cingöz on 28.01.2024.
//

import UIKit

class FollowersListVC: UIViewController {

  var username: String!
  var collectionView : UICollectionView!

  override func viewDidLoad() {
    super.viewDidLoad()
    configureCollectionView()
    configureViewController()
    getFollowers()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: true)
  }

  private func configureViewController(){
    view.backgroundColor = .systemBackground
    navigationController?.navigationBar.prefersLargeTitles = true

  }

  func configureCollectionView(){
    collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnFlowLayout())
    view.addSubview(collectionView)
    collectionView.backgroundColor = .systemCyan
    collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
  }


  func createThreeColumnFlowLayout() -> UICollectionViewFlowLayout{
    let width = view.bounds.width
    let padding: CGFloat = 12
    let minumumItemSpacing: CGFloat = 10
    let availableWidth = width - (padding * 2) - (minumumItemSpacing * 2)
    let itemWidth = availableWidth / 3

    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
    return flowLayout  }


  func getFollowers(){
    NetworkManager.shared.getFollowers(for: username, page: 1) { result in

      switch result {
      case .success(let followers):
        print(followers)

      case.failure(let error):
        self.presentGFAlertOnMainThread(title: "Bad things happend", message: error.rawValue, buttonTitle: "OK")
      }
    }
  }
}
