//
//  GFTextField.swift
//  GitHub Followers
//
//  Created by Furkan Cingöz on 28.01.2024.
//

import UIKit

class GFTextField: UITextField {

  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configure(){
    translatesAutoresizingMaskIntoConstraints = false

    layer.cornerRadius = 10
    layer.borderWidth = 2
    layer.borderColor = UIColor.systemGray4.cgColor // ***

    textColor = .label // light mode and dark mode changing color
    tintColor = .label
    textAlignment = .center
    font = UIFont.preferredFont(forTextStyle: .title2)
    adjustsFontSizeToFitWidth = true
    minimumFontSize = 12


    backgroundColor = .tertiarySystemBackground
    autocorrectionType = .no //auto correction off
    placeholder = "Enter user name"


  }
}
