//
//  KeyboardHandling.swift
//  Probafeladat
//
//  Created by Suhaj Milán on 2023. 09. 23..
//

import Foundation
import UIKit

extension UIViewController {
    
    func initializeHideKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissMyKeyboard(){
        view.endEditing(true)
    }
    
}
