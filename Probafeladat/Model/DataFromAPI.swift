//
//  Data.swift
//  Probafeladat
//
//  Created by Suhaj Milán on 2023. 09. 24..
//

import Foundation

struct DataFromAPI: Codable, Equatable {
    static func == (lhs: DataFromAPI, rhs: DataFromAPI) -> Bool {
        if lhs.items == rhs.items {
            return true
        }
        
        return false
    }
    
    var items: [Item]
}

struct Item: Codable, Equatable {
    static func == (lhs: Item, rhs: Item) -> Bool {
        if lhs.name == rhs.name &&
            lhs.owner == rhs.owner &&
            lhs.description == rhs.description &&
            lhs.stargazersCount == rhs.stargazersCount &&
            lhs.createdAt == rhs.createdAt &&
            lhs.updatedAt == rhs.updatedAt &&
            lhs.forksCount == rhs.forksCount &&
            lhs.htmlUrl == rhs.htmlUrl {
            return true
        }
        
        return false
    }
    
    var name: String
    var owner: Owner
    var description: String?
    var stargazersCount: Int
    var createdAt: String
    var updatedAt: String
    var forksCount: Int
    var htmlUrl: String
}

struct Owner: Codable, Equatable {
    static func == (lhs: Owner, rhs: Owner) -> Bool {
        if lhs.login == rhs.login &&
            lhs.avatarUrl == rhs.avatarUrl &&
            lhs.htmlUrl == rhs.htmlUrl {
            return true
        }
        
        return false
    }
    var login: String
    var avatarUrl: String
    var htmlUrl: String
}
