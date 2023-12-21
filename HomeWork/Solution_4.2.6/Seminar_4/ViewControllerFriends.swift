


import UIKit

class ViewControllerFriends: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    private var friends: [Friend] = []
    
    private var token: String?
    private var userId: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.title = "Friends"
        view.addSubview(tableView)
        setupConstraints()
//        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        let userDefaults = UserDefaults.standard
        token = userDefaults.string(forKey: "acsessToken")
        userId = userDefaults.string(forKey: "keyUserID")
        addFriends()
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
    
        private func setupConstraints() {
            tableView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            ])
        }
    }

    
    extension ViewControllerFriends: UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            "Friends"
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return friends.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            let friend = friends[indexPath.row]
            cell.textLabel?.text = "\(friend.firstName) \(friend.lastName)"
            cell.imageView?.image = UIImage(systemName: friend.isOnline == 1 ? "circle.fill" : "circle")

            return cell
        }
    }
    
    
