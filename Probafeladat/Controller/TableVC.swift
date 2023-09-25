//
//  TableVC.swift
//  Probafeladat
//
//  Created by Suhaj Milán on 2023. 09. 24..
//

import UIKit
import Kingfisher

class TableVC: UIViewController {
    
    private var dataArray = [Item]()
    private var repoIndex = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DataCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Vissza", style: .plain, target: nil, action: nil)
    }
    
    public func setDataArray(array: [Item]) {
        self.dataArray = array
    }

}

extension TableVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        repoIndex = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showRepo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRepo" {
            let destinationVC = segue.destination as! RepoVC
            destinationVC.setRepo(repo: dataArray[repoIndex])
        }
    }
}

extension TableVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! DataCell
        cell.name.text = dataArray[indexPath.row].name
        if let desc = dataArray[indexPath.row].description {
            cell.desc.text = desc
        } else {
            cell.desc.text = "Nincs elérhető leírás."
        }
        cell.starCnt.text = String(dataArray[indexPath.row].stargazersCount)
        cell.dateLabel.text = DateFormat.formatDate(date: dataArray[indexPath.row].updatedAt)
        return cell
    }
}
