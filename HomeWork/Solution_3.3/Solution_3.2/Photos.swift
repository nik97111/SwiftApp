//
//  Photos.swift
//  Solution_3.2
//
//  Created by Николай Чупреев on 09.12.2023.
//

import Foundation

struct Photoss: Codable {
    var photo: String
    
    enum CodingKeys: String, CodingKey {
        case photo = "photos"
    }
}

