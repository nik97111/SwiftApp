//
//  Group.swift
//  AppGB
//
//  Created by Николай Чупреев on 04.01.2024.
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
