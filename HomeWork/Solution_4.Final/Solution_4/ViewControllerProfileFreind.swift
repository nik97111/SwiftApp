//
//  ViewControllerProfileFreind.swift
//  Solution_4
//
//  Created by Николай Чупреев on 27.12.2023.
//

import UIKit

class ViewControllerProfileFreind: UIViewController {
    
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
    }
    
    private func setupCostraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        surnameLabel.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            surnameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            surnameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            photoImageView.topAnchor.constraint(equalTo: surnameLabel.bottomAnchor, constant: 40),
            photoImageView.widthAnchor.constraint(equalToConstant: 150),
            photoImageView.heightAnchor.constraint(equalToConstant: 150),
            photoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

