//
//  ViewControllerAnimation.swift
//  Solution_6
//
//  Created by Николай Чупреев on 27.12.2023.
//

import UIKit

class ViewControllerAnimation: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "kolobok"))
        //        Делаем UIImageView круглым (половина от размера и указываем imageView.clipsToBounds = true)
        imageView.layer.cornerRadius = 100
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.purple.cgColor
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        navigationItem.title = "Анимация"
//        navigationBar.topItem?.title = "Анимация"
        view.addSubview(imageView)
        setupConstraints()
        animationRotateImageView()
        animationImageViewThree()
        //        Переходим к контроллеру ViewControllerProfileUser через 4 сек
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            let profileVC = ViewControllerProfileUser()
            self.navigationController?.pushViewController(profileVC, animated: true)
        }
        
        // Наблюдатель за сменой темы
        NotificationCenter.default.addObserver(self, selector: #selector(updateTheme), name: .themeChanged, object: nil)
    }
    
    // Метод для применения выбранной темы
      func applyTheme(_ theme: AppTheme) {
          // Применение выбранной темы
          view.backgroundColor = theme.mainColor
      }

    
    @objc func updateTheme(_ notification: Notification) {
        if let selectedTheme = notification.object as? AppTheme {
            applyTheme(selectedTheme) // Применение выбранной темы
        }
    }
    
    
    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    private func animationImageViewThree() {
        UIView.animate(withDuration: 4, delay: 0.5, options: .curveEaseInOut, animations: {
            self.imageView.alpha = 0.0
        }) {_ in }
    }
    
    private func animationRotateImageView() {
        UIView.animate(withDuration: 1, delay: 0, options: UIView.AnimationOptions.curveLinear, animations: { () -> Void in
            self.imageView.transform = self.imageView.transform.rotated(by: .pi / 2)
        }) { (finished) -> Void in
            if finished {
                self.animationRotateImageView()
            }
        }
    }
}
