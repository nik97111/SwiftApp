//
//  ViewController.swift
//  Solution_1
//
//  Created by Николай Чупреев on 29.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
//    private let imageView: UIImageView = {
//        let imageView = UIImageView(image: UIImage(systemName: "person"))
////        imageView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
//        imageView.backgroundColor = .cyan
//        imageView.layer.cornerRadius = 10
//        imageView.layer.borderWidth = 5
//        imageView.layer.borderColor = UIColor.purple.cgColor
//        return imageView
//    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "kolobok"))
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.purple.cgColor
        return imageView
    }()
    
    private let textFieldLogin: UITextField = {
        let textFieldLogin = UITextField()
        textFieldLogin.text = "Логин"
        textFieldLogin.textAlignment = .center
        textFieldLogin.textColor = .white
        textFieldLogin.backgroundColor = .gray
        textFieldLogin.layer.cornerRadius = 5
        return textFieldLogin
    }()
    
    private let textFieldPassword: UITextField = {
        let textFieldPassword = UITextField()
        textFieldPassword.text = "Пароль"
        textFieldPassword.textAlignment = .center
        textFieldPassword.textColor = .white
        textFieldPassword.backgroundColor = .gray
        textFieldPassword.layer.cornerRadius = 5
        return textFieldPassword
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Авторизация"
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .brown
        label.layer.cornerRadius = 5
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.textColor = .black
        button.backgroundColor = .red
        button.layer.cornerRadius = 7
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.blue.cgColor
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupViews()
    }

    private func setupViews() {
        view.addSubview(imageView)
        view.addSubview(label)
        view.addSubview(textFieldLogin)
        view.addSubview(textFieldPassword)
        view.addSubview(button)
        setupConstraints()
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }

    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        textFieldLogin.translatesAutoresizingMaskIntoConstraints = false
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            imageView.widthAnchor.constraint(equalToConstant: view.frame.width / 4),
//            imageView.heightAnchor.constraint(equalToConstant: view.frame.width / 6),
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: view.frame.size.width / 2),
            label.heightAnchor.constraint(equalToConstant: view.frame.size.width / 8),
            
            textFieldLogin.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            textFieldLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldLogin.widthAnchor.constraint(equalToConstant: view.frame.width / 3),
            textFieldLogin.heightAnchor.constraint(equalToConstant: view.frame.width / 12),
            
            textFieldPassword.topAnchor.constraint(equalTo: textFieldLogin.bottomAnchor, constant: 20),
            textFieldPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldPassword.widthAnchor.constraint(equalToConstant: view.frame.width / 3),
            textFieldPassword.heightAnchor.constraint(equalToConstant: view.frame.width / 12),
            
            button.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: view.frame.width / 1.5),
            button.heightAnchor.constraint(equalToConstant: view.frame.width / 8)
        ])
    }
    
    @objc func tap() {
        navigationController?.pushViewController(NewViewController(), animated: true)
    }
}


