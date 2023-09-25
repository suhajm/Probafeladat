//
//  DateFormatter.swift
//  Probafeladat
//
//  Created by Suhaj Milán on 2023. 09. 25..
//

import Foundation

class DateFormat {
    static func formatDate(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let inDateFormat = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "yyyy.MM.dd HH:mm"
        return dateFormatter.string(from: inDateFormat!)
    }
}
