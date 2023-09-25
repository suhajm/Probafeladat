//
//  RepoVC.swift
//  Probafeladat
//
//  Created by Suhaj Milán on 2023. 09. 25..
//

import UIKit

class RepoVC: UIViewController {
    
    private var repo: Item?
    private var showURL: String?
    private var dateFormatter = DateFormatter()
        
    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var owner: UILabel!
    
    @IBOutlet weak var profileLink: UIButton!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var desc: UILabel!

    @IBOutlet weak var repoLink: UIButton!
    
    @IBOutlet weak var numberOfStars: UILabel!
    
    @IBOutlet weak var numberOfForks: UILabel!
    
    @IBOutlet weak var createdAt: UILabel!
    
    @IBOutlet weak var updatedAt: UILabel!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInfo()
        setViews()
    }
    
    
    @IBAction func profileLinkBtnPressed(_ sender: UIButton) {
        showURL = profileLink.currentTitle
        performSegue(withIdentifier: "showWeb", sender: self)
    }
    
    @IBAction func repoBtnPressed(_ sender: UIButton) {
        showURL = repoLink.currentTitle
        performSegue(withIdentifier: "showWeb", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showWeb" {
            let destinationVC = segue.destination as! WebViewVC
            destinationVC.setURL(url: showURL!)
        }
    }
    
    private func loadInfo() {
        avatar.kf.indicatorType = .activity
        let url = URL(string: repo!.owner.avatarUrl)
        avatar.kf.setImage(with: url, options: [.transition(.flipFromLeft(0.5))])
        avatar?.layer.cornerRadius = (avatar?.frame.size.width ?? 0.0) / 6
        avatar?.clipsToBounds = true
        avatar?.layer.borderWidth = 1.0
        avatar?.layer.borderColor = UIColor.black.cgColor
        owner.text = repo!.owner.login
        profileLink.setTitle(repo!.owner.htmlUrl, for: .normal)
        name.text = repo!.name
        desc.text = repo!.description
        repoLink.setTitle(repo!.htmlUrl, for: .normal)
        numberOfStars.text! = String(repo!.stargazersCount)
        numberOfForks.text! = String(repo!.forksCount)
        createdAt.text! = DateFormat.formatDate(date: repo!.createdAt)
        updatedAt.text! = DateFormat.formatDate(date: repo!.updatedAt)
    }
    
    public func setRepo(repo: Item) {
        self.repo = repo
    }
    
    private func setViews() {
        view1.layer.cornerRadius = 15.0
        view2.layer.cornerRadius = 15.0
        view3.layer.cornerRadius = 15.0
    }

}
