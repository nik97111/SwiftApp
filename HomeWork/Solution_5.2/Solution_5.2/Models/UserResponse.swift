
//  ContentView.swift
//  Solution_5.2
//
//  Created by Николай Чупреев on 13.12.2023.
//


import Foundation
import UIKit
import SwiftUI

struct UserResponse: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var publication_date: String
}
