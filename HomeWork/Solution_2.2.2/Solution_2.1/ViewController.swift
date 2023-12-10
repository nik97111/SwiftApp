
//  Created by Николай Чупреев on 09.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.titleLabel?.textColor = .black
        button.setTitle("Перейти к списку", for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.red.cgColor
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(button)
        setupConstraints()
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
        
    private func setupConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    @objc func tap() {
        let tabBarController = TabBarController()
        navigationController?.pushViewController(tabBarController, animated: true)
    }
}

