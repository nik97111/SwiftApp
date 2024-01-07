//
//  ViewControllerProfileUser.swift
//  AppGB
//
//  Created by Николай Чупреев on 04.01.2024.
//

import UIKit

class ViewControllerProfileUser: UIViewController {

    var profileUser: ProfileUser?

    private var token: String?
    private var userId: String?

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
        navigationItem.title = "Профиль пользователя"

        if let profileUser = profileUser {
            nameLabel.text = profileUser.firstNameUser
            surnameLabel.text = profileUser.lastNameUser
        }

        view.addSubview(nameLabel)
        view.addSubview(surnameLabel)
        view.addSubview(photoImageView)
        setupConstraints()
        let userDefaults = UserDefaults.standard
        token = userDefaults.string(forKey: "acsessToken")
        userId = userDefaults.string(forKey: "keyUserID")
        addProfileUser()

        let buttonReturn = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(backToFriendsList))
        navigationItem.leftBarButtonItem = buttonReturn

        let buttonChooseThemes = UIBarButtonItem(title: "Тема", style: .plain, target: self, action: #selector(tapButtonChooseThemes))
        navigationItem.rightBarButtonItem = buttonChooseThemes

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

    @objc func backToFriendsList() {
        if let viewController = navigationController?.viewControllers.filter({$0 is ViewControllerFriends}).first {
            navigationController?.popToViewController(viewController, animated: true)
        }
    }

    func applyTheme(_ theme: AppTheme) {
        view.backgroundColor = theme.mainColor

        // Сохранение выбранной темы в UserDefaults
        UserDefaults.standard.set(theme.rawValue, forKey: "selectedTheme")
    }

    @objc func tapButtonChooseThemes() {

        let chooseThemesVC = ViewControllerChooseThemes()

        chooseThemesVC.themeSelectedClosure = { [weak self] selectedTheme in
                self?.applyTheme(selectedTheme)
            }
        navigationController?.pushViewController(chooseThemesVC, animated: true)
    }

    private func addProfileUser() {
        // print("FriensToken \(token)")
        guard let token = self.token else {
            print("Отсутствует токен доступа")
            return
        }

        let networkService = NetworkServiceProfileUser(token: token)
            networkService.getData(token: token) { [weak self] profileUsers, error in
                if let profileUser = profileUsers?.first {
                    self?.profileUser = profileUser
                    DispatchQueue.main.async {
                        self?.updateUserProfile()
                    }
                } else if let error = error {
                    print(error.localizedDescription)
                }
            }
    }

    private func updateUserProfile() {
        guard let profileUser = profileUser else {
            return
        }

        nameLabel.text = profileUser.firstNameUser
        surnameLabel.text = profileUser.lastNameUser

        if let imageURL = URL(string: profileUser.photoProfileUser) {
                    DispatchQueue.global().async {
                        if let imageData = try? Data(contentsOf: imageURL),
                           let image = UIImage(data: imageData) {
                            DispatchQueue.main.async {
                                self.photoImageView.image = image
                            }
                        }
                    }
                }
    }

    private func setupConstraints() {
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
