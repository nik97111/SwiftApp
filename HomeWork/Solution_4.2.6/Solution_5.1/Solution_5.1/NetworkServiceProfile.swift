//
//  NetworkServiceProfile.swift
//  Solution_5.1
//
//  Created by Николай Чупреев on 24.12.2023.
//

import Foundation

final class NetworkServiceProfile {
    
    let token: String?
    
    init(token: String) {
        self.token = token
    }
    
    func getData(token: String, completion: @escaping ([Profile]?, Error?) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/users.get?fields=first_name,last_name,photo_100&access_token=\(token)&v=5.131") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(ResponseProfiles.self, from: data)
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
