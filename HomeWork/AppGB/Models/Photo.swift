//
//  Photo.swift
//  AppGB
//
//  Created by Николай Чупреев on 04.01.2024.
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
