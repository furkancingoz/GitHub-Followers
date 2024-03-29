//
//  FollowersListVC.swift
//  GitHub Followers
//
//  Created by Furkan Cingöz on 28.01.2024.
//

import UIKit

class FollowersListVC: UIViewController {

  enum Section { case main }

  var username: String!
  var followers: [Follower] = []
  var collectionView : UICollectionView!
  var dataSource : UICollectionViewDiffableDataSource<Section, Follower>!

  override func viewDidLoad() {
    super.viewDidLoad()
    configureCollectionView()
    configureViewController()
    getFollowers()
    configureDataSoure()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: true)
  }

  private func configureViewController(){
    view.backgroundColor = .systemPink
    navigationController?.navigationBar.prefersLargeTitles = true

  }

  func configureCollectionView(){
    collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
    view.addSubview(collectionView)
    collectionView.backgroundColor = .systemPink
    collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
  }

  func getFollowers(){
    NetworkManager.shared.getFollowers(for: username, page: 1) { [weak self] result in
      guard let self = self else { return }

      switch result {
      case .success(let followers):
        self.followers = followers
        self.updateData()

      case.failure(let error):
        self.presentGFAlertOnMainThread(title: "Bad things happend", message: error.rawValue, buttonTitle: "OK")
      }
    }
  }

  func configureDataSoure(){
    dataSource = UICollectionViewDiffableDataSource<Section,Follower>(collectionView: collectionView, cellProvider: { collectionView, indexPath, follower in
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
      cell.set(follower: follower)
      return cell
    })
  }

  func updateData(){
    var snapshot = NSDiffableDataSourceSnapshot<Section,Follower>()
    snapshot.appendSections([.main])
    snapshot.appendItems(followers)
    DispatchQueue.main.async{
      self.dataSource.apply(snapshot, animatingDifferences: true)
    }
  }
}
