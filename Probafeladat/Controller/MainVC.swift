//
//  MainVC.swift
//  Probafeladat
//
//  Created by Suhaj Milán on 2023. 09. 23..
//

import UIKit
import Lottie

class MainVC: ViewController {
    
    private let placeholderText = "pl.: tetris+language:swift&sort=stars&order=desc"
    private var dataManager = DataManager()
    private var dataArray = [Item]()
    
    private var animation: LottieAnimationView?
    
    @IBOutlet weak var animationView: UIView!

    @IBOutlet weak var url: UITextView!
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UD.shared.getData() == false {
            performSegue(withIdentifier: "showWelcome", sender: self)
        }
        dataManager.delegate = self
        initializeHideKeyboard()
        setUpTextView()
        setAnimation()
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Vissza", style: .plain, target: nil, action: nil)
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        checkURL()
    }
    
}

extension MainVC: UITextViewDelegate {
    
    private func setUpTextView() {
        url.delegate = self
        url.text = placeholderText
        url.textColor = UIColor.lightGray
        url.layer.borderWidth = 1.0
        url.layer.cornerRadius = 5.0
        url.layer.borderColor = UIColor.black.cgColor
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (url.text == placeholderText && url.textColor == UIColor.lightGray) {
            url.text = ""
            url.textColor = UIColor.black
            url.font = .systemFont(ofSize: 17)
        }
        url.becomeFirstResponder()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if url.text == "" {
            url.text = placeholderText
            url.textColor = UIColor.lightGray
            url.font = .systemFont(ofSize: 12)
        }
    }
    
    private func setAnimation() {
        animation = .init(name: "github")
        animation?.frame = animationView.bounds
        animation?.animationSpeed = 1.0
        animation?.loopMode = .loop
        animationView.addSubview(animation!)
    }
    
    private func playAnimation() {
        searchButton.setTitle("", for: .normal)
        ActivityIndicator.shared.setupActivityIndicator(view: view)
        view.endEditing(true)
        animation?.play()
        dataManager.performRequest(with: url.text)
    }
    
    private func checkURL() {
        if url.text == placeholderText {
            Alerts.alert(title: "", message: "Kérem, töltse ki a beviteli mezőt!", viewController: self)
        } else {
            playAnimation()
        }
    }
    
    private func backToNormal() {
        ActivityIndicator.shared.stopAnimating(view: self.view)
        self.animation?.loopMode = .playOnce
        self.url.text = self.placeholderText
        self.url.textColor = UIColor.lightGray
        self.url.font = .systemFont(ofSize: 12)
        self.searchButton.setTitle("Keresés", for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTable" {
            let destinationVC = segue.destination as! TableVC
            destinationVC.setDataArray(array: dataArray)
        }
    }
    
}

extension MainVC: DataManagerDelegate {
    func didGetData(_ dataManager: DataManager, data: DataFromAPI) {
        dataArray = data.items
        if dataArray.count > 0 {
            DispatchQueue.main.async {
                self.backToNormal()
                self.performSegue(withIdentifier: "showTable", sender: self)
            }
        } else {
            DispatchQueue.main.async {
                self.backToNormal()
                Alerts.alert(title: "Nincs találat!", message: "Nincs találat a megadott keresési feltételekkel.", viewController: self)
            }
        }

    }
    
    func didFailWithError(error: Error) {
        Alerts.alert(title: "Hiba!", message: "Hiba történt az adatok lekérdezésekor!", viewController: self)
    }
    
    
}
