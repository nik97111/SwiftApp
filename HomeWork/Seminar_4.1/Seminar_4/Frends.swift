//
//  Frends.swift
//  Seminar_4
//
//  Created by Николай Чупреев on 11.12.2023.
//

import Foundation

struct Frends: Codable {
    var nameFrends: String
    
    enum CodingKeys: String, CodingKey {
        case nameFrends = "name"
    }
}
