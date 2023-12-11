//
//  Photos.swift
//  Seminar_4
//
//  Created by Николай Чупреев on 11.12.2023.
//

import Foundation

struct Photos: Codable {
    var photo: String
    
    enum CodingKeys: String, CodingKey {
        case photo = "photos"
    }
}

