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

    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .systemBackground
      configureLogoImageView()
      configureTextField()
      confiugreButton()
    }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.isNavigationBarHidden = true

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
    NSLayoutConstraint.activate([
      userNameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor,constant: 48),
      userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
      userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50),
      userNameTextField.heightAnchor.constraint(equalToConstant: 50)
    ])
  }



 private func confiugreButton(){
    view.addSubview(callToActionButton)

    NSLayoutConstraint.activate([
      callToActionButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -100),
      callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
      callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50),
      callToActionButton.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
}
