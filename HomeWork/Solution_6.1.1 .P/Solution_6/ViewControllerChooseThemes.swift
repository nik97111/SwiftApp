//
//  ViewControllerChooseThemes.swift
//  Solution_6
//
//  Created by Николай Чупреев on 27.12.2023.
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
    
    @objc func themeButtonTapped(_ sender: UIButton) {
        if let title = sender.currentTitle, let selectedTheme = AppTheme(rawValue: title.lowercased()) {
            themeSelectedClosure?(selectedTheme) // Вызываем замыкание и передаем выбранную тему
            
            NotificationCenter.default.post(name: .themeChanged, object: selectedTheme)

            navigationController?.popViewController(animated: true) // Возвращаемся на предыдущий экран
        }
    }
}


extension Notification.Name {
    static let themeChanged = Notification.Name("")
}


//    lazy var themeButtons: [UIButton] = {
//        let whiteButton = UIButton(type: .system)
//        whiteButton.setTitle("White", for: .normal)
//        whiteButton.addTarget(self, action: #selector(themeButtonTapped), for: .touchUpInside)
//
//        let greenButton = UIButton(type: .system)
//        greenButton.setTitle("Green", for: .normal)
//        greenButton.addTarget(self, action: #selector(themeButtonTapped), for: .touchUpInside)
//
//        let blueButton = UIButton(type: .system)
//        blueButton.setTitle("Blue", for: .normal)
//        blueButton.addTarget(self, action: #selector(themeButtonTapped), for: .touchUpInside)
//
//        let grayButton = UIButton(type: .system)
//        grayButton.setTitle("Gray", for: .normal)
//        grayButton.addTarget(self, action: #selector(themeButtonTapped), for: .touchUpInside)
//
//        let orangeButton = UIButton(type: .system)
//        orangeButton.setTitle("Orange", for: .normal)
//        orangeButton.addTarget(self, action: #selector(themeButtonTapped), for: .touchUpInside)
//
//        return [whiteButton, greenButton, blueButton, grayButton, orangeButton]
//    }()
    
