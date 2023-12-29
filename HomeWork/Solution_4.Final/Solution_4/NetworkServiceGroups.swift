//
//  NetworkServiceGroups.swift
//  Solution_4
//
//  Created by Николай Чупреев on 27.12.2023.
//

import Foundation

final class NetworkServiceGroups {
    
    var token: String?
    
    init(token: String) {
        self.token = token
    }
    
    func getData(token: String, completion: @escaping ([Group]?, Error?) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/groups.get?extended=1&access_token=\(token)&v=5.131") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(ResponseGroups.self, from: data)
                    completion(response.response.items, nil)
                } catch {
                    completion(nil, error)
                }
            } else if let error = error {
                completion(nil, error)
            }
        }.resume()
    }
}





