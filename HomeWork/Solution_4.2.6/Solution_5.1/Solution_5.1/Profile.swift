//
//  Profile.swift
//  Solution_5.1
//
//  Created by Николай Чупреев on 24.12.2023.
//

import Foundation

struct Profile: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let photoProfile: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photoProfile = "photo_100"
    }
}

struct ResponseProfiles: Codable {
    var response: [Profile]
}
