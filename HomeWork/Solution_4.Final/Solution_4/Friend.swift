//
//  Friend.swift
//  Solution_4
//
//  Created by Николай Чупреев on 27.12.2023.
//

import Foundation
import UIKit

struct Friend: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let isOnline: Int
    
    let photoProfile: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case isOnline = "online"
        
        case photoProfile = "photo_100"
    }
}

struct ResponseFriends: Codable {
    var response: Friends
}

struct Friends: Codable {
    var count: Int
    var items: [Friend]
}


// Загрузка фото (по ID) друга при нажатии на ячейку
extension Friend {
    func loadPhoto(completion: @escaping (UIImage?) -> Void) {
        guard let imageURL = URL(string: photoProfile) else {
            completion(nil)
            return
        }

        let task = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            let image = UIImage(data: data)
            completion(image)
        }

        task.resume()
    }
}

