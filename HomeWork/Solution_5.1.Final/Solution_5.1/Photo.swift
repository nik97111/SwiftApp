//
//  Photo.swift
//  Solution_5.1
//
//  Created by Николай Чупреев on 24.12.2023.
//

import Foundation

struct Photo: Codable {
    let sizes: [PhotosSize]
    let text: String
}

struct PhotosSize: Codable {
    let height: Int
    let width: Int
    let type: String
    let url: String
}

struct ResponsePhotos: Codable {
    var response: Photos
}

struct Photos: Codable {
    var count: Int
    var items: [Photo]
}
