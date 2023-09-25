//
//  Alerts.swift
//  Probafeladat
//
//  Created by Suhaj Milán on 2023. 09. 23..
//

import Foundation
import UIKit

class Alerts {
    static func alert(title: String, message: String, viewController: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Rendben", style: .cancel)
        
        alert.addAction(action)
        viewController.present(alert, animated: true, completion: nil)
    }
}
