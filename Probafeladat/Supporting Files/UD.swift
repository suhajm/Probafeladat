//
//  UD.swift
//  Probafeladat
//
//  Created by Suhaj Milán on 2023. 09. 25..
//

import Foundation

class UD {
    
    static let shared = UD()
    
    let defaults = UserDefaults.standard
    
    func getData() -> Bool {
        return defaults.bool(forKey: "notFirst")
    }
    
    func setData() {
        defaults.setValue(true, forKey: "notFirst")
    }
    
}
