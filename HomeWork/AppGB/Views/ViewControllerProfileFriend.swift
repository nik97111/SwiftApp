//
//  ViewControllerProfileFriend.swift
//  AppGB
//
//  Created by Николай Чупреев on 04.01.2024.
//

import UIKit

class ViewControllerProfileFriend: UIViewController {

    var friend: Friend?
    var friendID: Int?

    init(friend: Friend) {
        self.friend = friend
        self.friendID = friend.id
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .gray
        return label
    }()

    private let surnameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .gray
        return label
    }()

    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.title = "Профиль друга"

        if let friend = friend {
            nameLabel.text = friend.firstName
            surnameLabel.text = friend.lastName

            friend.loadPhoto { [weak self] image in
                   DispatchQueue.main.async {
                       self?.photoImageView.image = image
                   }
               }
        }
        view.addSubview(nameLabel)
        view.addSubview(surnameLabel)
        view.addSubview(photoImageView)
        setupCostraints()

        NotificationCenter.default.addObserver(self, selector: #selector(updateTheme), name: .themeChanged, object: nil)

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

    // Метод для применения выбранной темы
      func applyTheme(_ theme: AppTheme) {
          // Применение выбранной темы
          view.backgroundColor = theme.mainColor
          // 2. Устанавливаем новый стиль для всех ячеек в приложении с помощью appearance:
          UILabel.appearance().customTextColor = theme.labelTextColor
      }

    @objc func updateTheme(_ notification: Notification) {
        if let selectedTheme = notification.object as? AppTheme {
            applyTheme(selectedTheme) // Применение выбранной темы
        }
    }

    private func setupCostraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        surnameLabel.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            surnameLabel.topAnchor.constraint(equalTo: nameLabel.safeAreaLayoutGuide.bottomAnchor, constant: 5),
            surnameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            photoImageView.topAnchor.constraint(equalTo: surnameLabel.bottomAnchor, constant: 40),
            photoImageView.widthAnchor.constraint(equalToConstant: 150),
            photoImageView.heightAnchor.constraint(equalToConstant: 150),
            photoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
