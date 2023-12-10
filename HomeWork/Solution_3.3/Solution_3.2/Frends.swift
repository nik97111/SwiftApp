//
//  Frends.swift
//  Solution_3.2
//
//  Created by Николай Чупреев on 09.12.2023.
//

import Foundation

struct Frends: Codable {
    var nameFrends: String
    
    enum CodingKeys: String, CodingKey {
        case nameFrends = "name"
    }
}
