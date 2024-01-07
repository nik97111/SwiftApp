//
//  AppTheme.swift
//  AppGB
//
//  Created by Николай Чупреев on 04.01.2024.
//

import UIKit

enum AppTheme: String {
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
            return UIColor.systemGreen
        case .blue:
            return UIColor.systemBlue
        case .gray:
            return UIColor.systemGray
        case .orange:
            return UIColor.systemOrange
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

    var backgroundColor: UIColor {
        switch self {
        case .white:
            return UIColor.systemMint
        case .green:
            return UIColor.systemIndigo
        case .blue:
            return UIColor.systemBrown
        case .gray:
            return UIColor.systemTeal
        case .orange:
            return UIColor.systemPink
        }
    }

    var labelTextColor: UIColor {
        switch self {
        case .white:
            return UIColor.red
        case .green:
            return UIColor.yellow
        case .blue:
            return UIColor.red
        case .gray:
            return UIColor.purple
        case .orange:
            return UIColor.red
        }
    }
    var tableView: UIColor {
        switch self {
        case .white:
            return UIColor.systemCyan
        case .green:
            return UIColor.systemCyan
        case .blue:
            return UIColor.white
        case .gray:
            return UIColor.white
        case .orange:
            return UIColor.systemCyan
        }
    }

    var tableViewCell: UIColor {
        switch self {
        case .white:
            return UIColor.systemGray6
        case .green:
            return UIColor.systemGray5
        case .blue:
            return UIColor.white
        case .gray:
            return UIColor.white
        case .orange:
            return UIColor.systemGray4
        }
    }

    var collectionView: UIColor {
        switch self {
        case .white:
            return UIColor.systemCyan
        case .green:
            return UIColor.systemCyan
        case .blue:
            return UIColor.white
        case .gray:
            return UIColor.white
        case .orange:
            return UIColor.systemCyan
        }
    }
}
