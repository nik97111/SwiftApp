//
//  ViewControllerGroups.swift
//  Seminar_4
//
//  Created by Николай Чупреев on 11.12.2023.
//

import UIKit

class ViewControllerGroups: UIViewController {

    private let tableView = UITableView(frame: .zero, style: .plain)
    private let dataGroups = ["Спорт", "Отдых", "Работа", "Развлечения", "Хобби"]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.title = "Groups"
        view.addSubview(tableView)
        setupCostraints()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupCostraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

extension ViewControllerGroups: UITableViewDelegate {}

extension ViewControllerGroups: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Groups"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = dataGroups[indexPath.row]
        cell.imageView?.image = UIImage(systemName: "circle")
        return cell
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell: UITableViewCell = {
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell") else {
//                return UITableViewCell(style: UITableViewCell.CellStyle.value2, reuseIdentifier: "UITableViewCell")
//            }
//            return cell
//        }()
//        cell.textLabel?.text = "Key"
//        cell.detailTextLabel?.text = "Value"
//
//        return cell
//    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        30
    }
}



