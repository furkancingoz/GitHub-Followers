//
//  SearchVC.swift
//  GitHub Followers
//
//  Created by Furkan Cingöz on 27.01.2024.
//

import UIKit

class SearchVC: UIViewController {

  let logoImageView = UIImageView()
  let userNameTextField = GFTextField()
  let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
  var isUserNameEntered: Bool { return !userNameTextField.text!.isEmpty }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    configureLogoImageView()
    configureTextField()
    confiugreButton()
    createDismissKeyboardTapGesture()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.isNavigationBarHidden = true

  }


  func createDismissKeyboardTapGesture(){
    let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
    view.addGestureRecognizer(tap)
  }

  @objc func pushFollowersListVC(){
    guard isUserNameEntered else {
      presentGFAlertOnMainThread(title: "Empty Username", message: "Please enter a username. We need to know who to look for 😀🤷🏻‍♂️", buttonTitle: "OK")
      return
      }
    let followersListVC = FollowersListVC()
    followersListVC.username = userNameTextField.text
    followersListVC.title = userNameTextField.text
    navigationController?.pushViewController(followersListVC, animated: true)
  }

  private  func configureLogoImageView(){
    view.addSubview(logoImageView)
    logoImageView.translatesAutoresizingMaskIntoConstraints = false
    logoImageView.image = UIImage(named: "gh-logo")!

    NSLayoutConstraint.activate([
      logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 80),
      logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      logoImageView.heightAnchor.constraint(equalToConstant: 200),
      logoImageView.widthAnchor.constraint(equalToConstant: 200),
    ])
  }

  private  func configureTextField(){
    view.addSubview(userNameTextField)
    userNameTextField.delegate = self
    NSLayoutConstraint.activate([
      userNameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor,constant: 48),
      userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
      userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50),
      userNameTextField.heightAnchor.constraint(equalToConstant: 50)
    ])
  }

  private func confiugreButton(){
    view.addSubview(callToActionButton)
    callToActionButton.addTarget(self, action: #selector(pushFollowersListVC), for: .touchUpInside)
    NSLayoutConstraint.activate([
      callToActionButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -100),
      callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
      callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50),
      callToActionButton.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
}


extension SearchVC : UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    pushFollowersListVC()
    return true
  }
}
