//
//  ActivityIndicator.swift
//  Probafeladat
//
//  Created by Suhaj Milán on 2023. 09. 23..
//

import Foundation
import UIKit

class ActivityIndicator {
    
    static let shared = ActivityIndicator()
    
    let activityIndicator = UIActivityIndicatorView()
    
    func setupActivityIndicator(view: UIView) {
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .medium
        activityIndicator.color = UIColor.white
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        view.isUserInteractionEnabled = false
    }
    
    func stopAnimating(view: UIView) {
        view.isUserInteractionEnabled = true
        activityIndicator.stopAnimating()
    }
    
}
