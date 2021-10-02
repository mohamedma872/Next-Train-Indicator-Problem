//
//  UIViewController + Extension.swift
//  NTI
//
//  Created by Mohamed Elsdody on 02/10/2021.
//

import Foundation
import UIKit
import MBProgressHUD
import RxSwift
import RxCocoa
import RxSwiftExt
extension UIViewController {
    func showIndicator() {
        DispatchQueue.main.async {
            let indicator = MBProgressHUD.showAdded(to: self.view, animated: true)
            indicator.label.text = ""
            indicator.isUserInteractionEnabled = false
            indicator.detailsLabel.text = ""
            indicator.show(animated: true)
            self.view.isUserInteractionEnabled = false
        }
    }
    func hideIndicator() {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
            self.view.isUserInteractionEnabled = true
        }
    }
    func alert(title : String, message : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func alert(title : String, message : String , complete :@escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (_) in
            complete()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

