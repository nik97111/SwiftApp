//
//  ViewControllerGroups.swift
//  Solution_4
//
//  Created by Николай Чупреев on 27.12.2023.
//

import UIKit

class ViewControllerGroups: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    private var groups: [Group] = []
    
    private var token: String?
    private var userId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        view.addSubview(tableView)
        setupCostraints()
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        let userDefaults = UserDefaults.standard
        token = userDefaults.string(forKey: "acsessToken")
        userId = userDefaults.string(forKey: "keyUserID")
        addGroups()
    }
    
    private func addGroups() {
        //        print("GroupsToken \(token)")
        guard let token = self.token else {
            print("Отсутствует токен доступа")
            return
        }
        
        let networkService = NetworkServiceGroups(token: token)
        networkService.getData(token: token) { [weak self] fetchedGroups, error in
            guard let self = self else { return }
            if let error = error {
                print("Ошибка получения данных: \(error)")
            } else if let groups = fetchedGroups {
                self.groups = groups
                //                print("Groups:")
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    private func setupCostraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension ViewControllerGroups: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Сообщества"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let group = groups[indexPath.row]
        cell.textLabel?.text = "\(group.name)"
        cell.imageView?.image = UIImage(systemName: "circle")
        return cell
    }
}

