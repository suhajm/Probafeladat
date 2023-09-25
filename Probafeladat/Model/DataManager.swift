//
//  DataManager.swift
//  Probafeladat
//
//  Created by Suhaj Milán on 2023. 09. 24..
//

import Foundation

protocol DataManagerDelegate {
    func didGetData(_ dataManager: DataManager, data: DataFromAPI)
    func didFailWithError(error: Error)
}

struct DataManager {

    let apiURL = "https://api.github.com/search/repositories?q="
    var delegate: DataManagerDelegate?
    
    func performRequest(with urlString: String) {
        if let url = URL(string: apiURL + "\(urlString)") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let gotData = self.parseJSON(safeData) {
                        self.delegate?.didGetData(self, data: gotData)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ dataFromAPI: Data) -> DataFromAPI? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let decodedData = try decoder.decode(DataFromAPI.self, from: dataFromAPI)
            let data = DataFromAPI(items: decodedData.items)
            return data
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
