//
//  UIViewController+Ext.swift
//  GitHub Followers
//
//  Created by Furkan Cingöz on 28.01.2024.
//

import UIKit

extension UIViewController {

  func presentGFAlertOnMainThread(title: String, message: String, buttonTitle:String){
    DispatchQueue.main.async{
      let alertVC = GFAlertVC(alertTitle: title, message: message, butonTitle: buttonTitle)
      alertVC.modalPresentationStyle = .overFullScreen
      alertVC.modalTransitionStyle = .crossDissolve
      self.present(alertVC, animated: true)
    }
  }
}
