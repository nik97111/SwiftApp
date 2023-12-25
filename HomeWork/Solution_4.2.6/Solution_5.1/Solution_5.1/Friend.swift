//
//  Friend.swift
//  Solution_5.1
//
//  Created by Николай Чупреев on 24.12.2023.
//

import Foundation

struct Friend: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let isOnline: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case isOnline = "online"
    }
}

struct ResponseFriends: Codable {
    var response: Friends
}

struct Friends: Codable {
    var count: Int
    var items: [Friend]
}
