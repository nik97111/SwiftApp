//
//  ProfileUser.swift
//  AppGB
//
//  Created by Николай Чупреев on 04.01.2024.
//

import Foundation

struct ProfileUser: Codable {
    let id: Int
    let firstNameUser: String
    let lastNameUser: String
    let photoProfileUser: String

    enum CodingKeys: String, CodingKey {
        case id
        case firstNameUser = "first_name"
        case lastNameUser = "last_name"
        case photoProfileUser = "photo_100"
    }
}

struct ResponseProfileUser: Codable {
    var response: [ProfileUser]
}
