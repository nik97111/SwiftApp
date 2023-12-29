//
//  NetworkServiceProfileUser.swift
//  Solution_6
//
//  Created by Николай Чупреев on 27.12.2023.
//

import Foundation

final class NetworkServiceProfileUser {
    
    let token: String?
    
    init(token: String) {
        self.token = token
    }
    
    func getData(token: String, completion: @escaping ([ProfileUser]?, Error?) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/users.get?fields=first_name,last_name,photo_100&access_token=\(token)&v=5.131") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(ResponseProfileUser.self, from: data)
                    completion(response.response, nil)
                } catch {
                    completion(nil, error)
                }
            } else if let error = error {
                completion(nil, error)
            }
        }.resume()
    }
}

