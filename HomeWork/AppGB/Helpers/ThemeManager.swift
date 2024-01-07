//
//  ThemeManager.swift
//  AppGB
//
//  Created by Николай Чупреев on 04.01.2024.
//

import UIKit

class ThemeManager {
    static func applyTheme(_ theme: AppTheme) {
        // Установка цвета фона главного окна приложения
        if let appDelegate = UIApplication.shared.delegate {
            if let window = appDelegate.window {
                window?.backgroundColor = theme.mainColor
            }
        }
    }
}
