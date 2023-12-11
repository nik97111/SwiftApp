//
//  Groups.swift
//  Seminar_4
//
//  Created by Николай Чупреев on 11.12.2023.
//

import Foundation

struct Groups: Codable {
    var nameGroups: String
    
    enum CodingKeys: String, CodingKey {
        case nameGroups = "listGroups"
    }
}

