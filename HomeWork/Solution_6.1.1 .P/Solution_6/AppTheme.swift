//
//  Themes.swift
//  Solution_6
//
//  Created by Николай Чупреев on 27.12.2023.
//

// Theme.swift

import UIKit

enum AppTheme {
    case white
    case green
    case blue
    case gray
    case orange
    
    var mainColor: UIColor {
        switch self {
        case .white:
            return UIColor.white
        case .green:
            return UIColor.green
        case .blue:
            return UIColor.blue
        case .gray:
            return UIColor.gray
        case .orange:
            return UIColor.orange
        }
    }
    
    init?(rawValue: String) {
            switch rawValue {
            case "white":
                self = .white
            case "green":
                self = .green
            case "blue":
                self = .blue
            case "gray":
                self = .gray
            case "orange":
                self = .orange
            default:
                return nil
            }
    }
}
