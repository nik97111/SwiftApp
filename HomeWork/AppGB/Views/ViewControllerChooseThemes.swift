//
//  ViewControllerChooseThemes.swift
//  AppGB
//
//  Created by Николай Чупреев on 04.01.2024.
//

import UIKit

class ViewControllerChooseThemes: UIViewController {

    var themeSelectedClosure: ((AppTheme) -> Void)?

    lazy var themeButtons: [UIButton] = {
        let whiteButton = makeStyledButton(title: "White")
        let greenButton = makeStyledButton(title: "Green")
        let blueButton = makeStyledButton(title: "Blue")
        let grayButton = makeStyledButton(title: "Gray")
        let orangeButton = makeStyledButton(title: "Orange")

        return [whiteButton, greenButton, blueButton, grayButton, orangeButton]
    }()

    private func makeStyledButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: #selector(themeButtonTapped), for: .touchUpInside)
        return button
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupThemeButtons()

        // Применение сохраненной темы при запуске
        if let savedTheme = UserDefaults.standard.string(forKey: "selectedTheme"),
           let selectedTheme = AppTheme(rawValue: savedTheme) {
            applyTheme(selectedTheme)
            ThemeManager.applyTheme(selectedTheme)

            // Обновление окна приложения после применения новой темы
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate,
               let window = appDelegate.window {
                window.backgroundColor = selectedTheme.mainColor
            }
        }
    }

    private func setupThemeButtons() {
        let stackView = UIStackView(arrangedSubviews: themeButtons)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        view.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -20)
        ])
    }

    // Метод для применения выбранной темы
      func applyTheme(_ theme: AppTheme) {
          // Применение выбранной темы
          view.backgroundColor = theme.mainColor
      }

    @objc func themeButtonTapped(_ sender: UIButton) {
        if let title = sender.currentTitle, let selectedTheme = AppTheme(rawValue: title.lowercased()) {
            themeSelectedClosure?(selectedTheme) // Вызываем замыкание и передаем выбранную тему

            NotificationCenter.default.post(name: .themeChanged, object: selectedTheme)

            // Сохраняем выбранную тему в UserDefaults
            UserDefaults.standard.set(selectedTheme.rawValue, forKey: "selectedTheme")
            navigationController?.popViewController(animated: true) // Возвращаемся на предыдущий экран
        }
    }
}

extension Notification.Name {
    static let themeChanged = Notification.Name("themeChanged")
}
