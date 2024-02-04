//
//  FollowersListVC.swift
//  GitHub Followers
//
//  Created by Furkan Cingöz on 28.01.2024.
//

import UIKit

class FollowersListVC: UIViewController {

  var username: String!

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .systemBackground
    navigationController?.navigationBar.prefersLargeTitles = true
    NetworkManager.shared.getFollowers(for: username, page: 1) { flwrs, errr in
      guard let followers = flwrs else {
        self.presentGFAlertOnMainThread(title: "TEST", message: errr!, buttonTitle: "OK")
        return
      }

      print("Followers count \(followers.count)")
      print(followers)
    }
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: true)
  }
}
