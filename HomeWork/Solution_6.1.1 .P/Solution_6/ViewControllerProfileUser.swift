//
//  ViewControllerProfileUser.swift
//  Solution_6
//
//  Created by Николай Чупреев on 27.12.2023.
//

import UIKit

class ViewControllerProfileUser: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    private var profileUser: [ProfileUser] = []
    
    private var token: String?
    private var userId: String?
    
    var friendID: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Профиль пользователя"
        view.addSubview(tableView)
        setupConstraints()
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        let userDefaults = UserDefaults.standard
        token = userDefaults.string(forKey: "acsessToken")
        userId = userDefaults.string(forKey: "keyUserID")
        addProfileUser()
        
        let buttonReturn = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(Return))
        navigationItem.leftBarButtonItem = buttonReturn
        
        let buttonChooseThemes = UIBarButtonItem(title: "Тема", style: .plain, target: self, action: #selector(tapButtonChooseThemes))
        navigationItem.rightBarButtonItem = buttonChooseThemes
        
    }
    
    @objc func Return() {
        if let viewController = navigationController?.viewControllers.filter({$0 is ViewControllerFriends}).first {
            navigationController?.popToViewController(viewController, animated: true)
        }
    }
    
    @objc func tapButtonChooseThemes() {
        
        let chooseThemesVC = ViewControllerChooseThemes()
        
        chooseThemesVC.themeSelectedClosure = { [weak self] selectedTheme in
                self?.applyTheme(selectedTheme)
        // Здесь можем передать выбранную тему другим контроллерам, если необходимо
//            ViewControllerAnimation().applyTheme(selectedTheme)
//            ViewControllerFriends().applyTheme(selectedTheme)
            }
        navigationController?.pushViewController(chooseThemesVC, animated: true)
    }
    
    
    private func addProfileUser() {
        //        print("FriensToken \(token)")
        guard let token = self.token else {
            print("Отсутствует токен доступа")
            return
        }
        
        let networkService = NetworkServiceProfileUser(token: token)
        networkService.getData(token: token) { [weak self] fetchedProfileUser, error in
            guard let self = self else { return }
            if let error = error {
                print("Ошибка получения данных: \(error)")
            } else if let profileUser = fetchedProfileUser {
                self.profileUser = profileUser
                //                print("Pfofiles:")
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}

extension ViewControllerProfileUser: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Профиль пользователя"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        guard indexPath.row < profileUser.count else {
            return cell
        }
        let profile = profileUser[indexPath.row]
        cell.textLabel?.text = "\(profile.firstNameUser) \(profile.lastNameUser)"
        
        if let url = URL(string: profile.photoProfileUser) {
            URLSession.shared.dataTask(with: url) { data, _, error in
                if let data = data {
                    DispatchQueue.main.async {
                        if let updateCell = tableView.cellForRow(at: indexPath) {
                            updateCell.imageView?.image = UIImage(data: data)
                            updateCell.setNeedsLayout()
                        }
                    }
                } else if let error = error {
                    print("Ошибка загрузки изображения: \(error)")
                }
            }.resume()
        }
        
        return cell
    }
}

// Метод применения выбранной темы
extension ViewControllerProfileUser {
    func applyTheme(_ theme: AppTheme) {
        view.backgroundColor = theme.mainColor
    }
}
