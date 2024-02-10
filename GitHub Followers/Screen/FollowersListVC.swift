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
    collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewLayout())
    view.addSubview(collectionView)
    collectionView.backgroundColor = .systemCyan
    collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
  }

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
