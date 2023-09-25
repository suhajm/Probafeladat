//
//  WelcomeVC.swift
//  Probafeladat
//
//  Created by Suhaj Milán on 2023. 09. 25..
//

import UIKit
import Lottie

class WelcomeVC: UIViewController {
    
    @IBOutlet weak var animationView: UIView!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    
    private var animation: LottieAnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UD.shared.setData()
        setView()
        setAnimation()
    }
    
    @IBAction func readBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    private func setAnimation() {
        animation = .init(name: "welcome")
        animation?.frame = animationView.bounds
        animation?.animationSpeed = 1.0
        animation?.loopMode = .loop
        animationView.addSubview(animation!)
        animation?.play()
    }
    
    private func setView() {
        animationView?.layer.cornerRadius = 15.0
        view1?.layer.cornerRadius = 15.0
        view2?.layer.cornerRadius = 15.0
        view3?.layer.cornerRadius = 15.0
        view4?.layer.cornerRadius = 15.0
        view5?.layer.cornerRadius = 15.0
    }
}
