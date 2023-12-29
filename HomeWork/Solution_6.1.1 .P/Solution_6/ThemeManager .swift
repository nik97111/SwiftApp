//
//  ThemeManager .swift
//  Solution_6
//
//  Created by Николай Чупреев on 28.12.2023.
//

import UIKit

class ThemeManager {
    static func applyTheme(_ theme: AppTheme) {
        // Устанавливаем цвет фона главного окна приложения
        if let appDelegate = UIApplication.shared.delegate {
            if let window = appDelegate.window {
                window?.backgroundColor = theme.mainColor
            }
        }
    }
}

