//
//  WebViewVC.swift
//  Probafeladat
//
//  Created by Suhaj Milán on 2023. 09. 25..
//

import UIKit
import WebKit

class WebViewVC: UIViewController {
    
    private var url: String?

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest.init(url: URL(string: url!)!))
    }
    
    @IBAction func doneBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    public func setURL(url: String) {
        self.url = url
    }

}
