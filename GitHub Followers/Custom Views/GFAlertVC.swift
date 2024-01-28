//
//  GFAlertVC.swift
//  GitHub Followers
//
//  Created by Furkan Cingöz on 28.01.2024.
//

import UIKit

class GFAlertVC: UIViewController {

  let containerView = UIView()
  let titleLabel = GFTitleLabel(textAlingment: .center, fontSize: 20)
  let bodyMessageLabel = GFBodyLabel(textAlingment: .center)
  let actionButton = GFButton(backgroundColor: .systemPink, title: "OK")

  var alertTitle: String?
  var message: String?
  var butonTitle: String?

  let padding:CGFloat = 20

  init(alertTitle: String?, message: String?, butonTitle: String?) {
    super.init(nibName: nil, bundle: nil)
    self.alertTitle = alertTitle
    self.message = message
    self.butonTitle = butonTitle
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
    configureContainerView()
    configureTitleLabel()
    configureOkButton()
    configureBodyLabel()
  }

  func configureContainerView(){
    view.addSubview(containerView)
    containerView.backgroundColor = .systemBackground
    containerView.layer.cornerRadius = 16
    containerView.layer.borderWidth = 2
    containerView.layer.borderColor = UIColor.white.cgColor
    containerView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      containerView.heightAnchor.constraint(equalToConstant: 220),
      containerView.widthAnchor.constraint(equalToConstant: 280),
    ])
  }

  func configureTitleLabel(){
    containerView.addSubview(titleLabel)
    titleLabel.text = alertTitle ?? "Something went wrong"
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor,constant: padding),
      titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: padding),
      titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
      titleLabel.heightAnchor.constraint(equalToConstant: 28)
    ])
  }

  func configureOkButton() {
    containerView.addSubview(actionButton)
    actionButton.setTitle(butonTitle ?? "OK", for: .normal)
    actionButton.addTarget(self, action: #selector(dissmissVC), for: .touchUpInside)

    NSLayoutConstraint.activate([
      actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
      actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: padding),
      actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
      actionButton.heightAnchor.constraint(equalToConstant: 44)
    ])

  }
  @objc func dissmissVC(){
    dismiss(animated: true)
  }

  func configureBodyLabel(){
    containerView.addSubview(bodyMessageLabel)
    bodyMessageLabel.text = message ??  "Unable to complete request"
    bodyMessageLabel.numberOfLines = 4

    NSLayoutConstraint.activate([
      bodyMessageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 8),
      bodyMessageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
      bodyMessageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
      bodyMessageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12),
     // bodyMessageLabel.heightAnchor.constraint(equalToConstant: 20),
    ])
  }

}
