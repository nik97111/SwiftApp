//
//  ViewControllerFriends.swift
//  Solution_6
//
//  Created by Николай Чупреев on 27.12.2023.
//

import UIKit
import CoreData

class ViewControllerFriends: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    private var friends: [Friend] = []
    
    private var token: String?
    private var userId: String?
    
    let moc = DataController().managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        let button = UIBarButtonItem(title: "Профиль", style: .plain, target: self, action: #selector(tapButton))
        navigationItem.rightBarButtonItem = button
        view.addSubview(tableView)
        setupConstraints()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        let userDefaults = UserDefaults.standard
        token = userDefaults.string(forKey: "acsessToken")
        userId = userDefaults.string(forKey: "keyUserID")
        addFriends()
        
//        seedFriendsCD()
        fetch()
    }
    
    @objc func tapButton() {
        navigationController?.pushViewController(ViewControllerAnimation(), animated: true)
    }
    
    
    private func addFriends() {
        //        print("FriensToken \(token)")
        guard let token = self.token else {
            print("Отсутствует токен доступа")
            return
        }
        
        let networkService = NetworkServiceFriends(token: token)
        networkService.getData(token: token) { [weak self] fetchedFriends, error in
            guard let self = self else { return }
            if let error = error {
                print("Ошибка получения данных: \(error)")
            } else if let friends = fetchedFriends {
                self.friends = friends
                //                print("Friends:")
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    // Добавляем запись в базу данных
    func seedFriendsCD() {
//        let moc = DataController().managedObjectContext
        
        let entity = NSEntityDescription.insertNewObject(forEntityName: "FriendsCD", into: moc)
        
        entity.setValue("Екатерина", forKey: "firstName")
        entity.setValue("Потапова", forKey: "lastName")
        
        do {
            try moc.save()
        } catch {
            fatalError("failure to save context: \(error)")
        }
    }
    
//     Извлечение записи
    func  fetch() {
        let friendsCDFetch  = NSFetchRequest<NSFetchRequestResult>(entityName: "FriendsCD")
        
        do {
            let fetchedFriendsCD = try moc.executeFetchRequest(friendsCDFetch) as! [FriendsCD]
            print(fetchedFriendsCD.first!.firstName!)
        } catch {
            fatalError("bad things happened \(error)")
        }
    }
    
    
    
    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension ViewControllerFriends: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Друзья"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let friend = friends[indexPath.row]
        cell.textLabel?.text = "\(friend.firstName) \(friend.lastName)"
        
        if friend.isOnline == 1 {
            cell.imageView?.image = UIImage(systemName: "circle.fill")!.withTintColor(.blue, renderingMode: .alwaysOriginal)
            cell.textLabel?.textColor = .blue
        } else {
            cell.imageView?.image = UIImage(systemName: "circle.fill")!.withTintColor(.gray, renderingMode: .alwaysOriginal)
            cell.textLabel?.textColor = .gray
        }
        
        return cell
    }
}
// При нажатии на ячейку переходим в окно - Профиль друга (ViewControllerProfileFreind)
extension ViewControllerFriends: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedFriend  = friends[indexPath.row]
        let profileVC = ViewControllerProfileFreind(friend: selectedFriend)
        profileVC.friendID = selectedFriend.id
        navigationController?.pushViewController(profileVC, animated: true)
    }
}

