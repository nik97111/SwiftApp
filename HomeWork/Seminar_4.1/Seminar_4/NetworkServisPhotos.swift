//
//  NetworkServisPhotos.swift
//  Seminar_4
//
//  Created by Николай Чупреев on 11.12.2023.
//

import Foundation

final class NetworkServisPhotos {
    
    func getData() {
        
        guard let url = URL(string: "https://api.vk.com/method/photos.get?extended=1&v=5.131") else { return }
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            print(data)
            guard let response = response as? HTTPURLResponse else { return }
            self.getImageByCode(code: response.statusCode)
            print(response)
            do {
                let photos = try JSONDecoder().decode([Photos].self, from: data)
                print(photos)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getImageByCode(code: Int) {
        
        guard let url = URL(string: "https://http.cat/\(code)") else { return }
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            print(data)
            print(response!)
            
        }.resume()
    }
}



