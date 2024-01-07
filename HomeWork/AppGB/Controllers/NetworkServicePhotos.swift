//
//  NetworkServicePhotos.swift
//  AppGB
//
//  Created by Николай Чупреев on 04.01.2024.
//

import Foundation

final class NetworkServicePhotos {

    let token: String?

    init(token: String) {
        self.token = token
    }

    func getData(token: String, completion: @escaping ([Photo]?, Error?) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/photos.get?album_id=profile&access_token=\(token)&v=5.131") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(ResponsePhotos.self, from: data)
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
