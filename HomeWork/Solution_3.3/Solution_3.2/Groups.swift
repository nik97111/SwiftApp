//
//  Groups.swift
//  Solution_3.2
//
//  Created by Николай Чупреев on 09.12.2023.
//

import Foundation

struct Groups: Codable {
    var nameGroups: String
    
    enum CodingKeys: String, CodingKey {
        case nameGroups = "listGroups"
    }
}
