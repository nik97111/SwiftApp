//
//  ViewControllerPhotos.swift
//  Solution_6
//
//  Created by Николай Чупреев on 27.12.2023.
//

import UIKit

class ViewControllerPhotos: UIViewController {
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: CollectionViewFlowLayoutCards())
    
    private var photos: [Photo] = []
    
    private var token: String?
    private var userId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.register(CollectionViewCards.self, forCellWithReuseIdentifier: "collectionViewCards")
        setupConstraints()
        let userDefaults = UserDefaults.standard
        token = userDefaults.string(forKey: "acsessToken")
        userId = userDefaults.string(forKey: "keyUserID")
        addPhotos()
        
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
    
    
    private func addPhotos() {
        //        print("FriensToken \(token)")
        guard let token = self.token else {
            print("Отсутствует токен доступа")
            return
        }
        
        let networkService = NetworkServicePhotos(token: token)
        networkService.getData(token: token) { [weak self] fetchedPhotos, error in
            guard let self = self else { return }
            if let error = error {
                print("Ошибка получения данных: \(error)")
            } else if let photos = fetchedPhotos {
                self.photos = photos
                //                print("Photos:")
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension ViewControllerPhotos: UICollectionViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Фото"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCards", for: indexPath) as! CollectionViewCards
        let photo = photos[indexPath.item]
        if let url = URL(string: photo.sizes.first?.url ?? "") {
            URLSession.shared.dataTask(with: url) { data, _, error in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        cell.imageView.image = image
                    }
                }
            }.resume()
        }
        
        return cell
    }
}

