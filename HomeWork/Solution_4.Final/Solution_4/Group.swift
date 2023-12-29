//
//  Group.swift
//  Solution_4
//
//  Created by Николай Чупреев on 27.12.2023.
//

import Foundation

struct Group: Codable {
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "name"
    }
}

struct ResponseGroups: Codable {
    var response: Groups
}

struct Groups: Codable {
    var count: Int
    var items: [Group]
}
