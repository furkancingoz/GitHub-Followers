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
    navigationController?.isNavigationBarHidden = false
    view.backgroundColor = .systemBackground
    navigationController?.navigationBar.prefersLargeTitles = true
  }


}
