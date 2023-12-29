//
//  ViewControllerPhotos.swift
//  Solution_5.1
//
//  Created by Николай Чупреев on 24.12.2023.
//

import UIKit

class ViewControllerPhotos: UIViewController {
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: CollectionViewFlowLayoutCards())
    
    private var photos: [Photo] = []
    
    private var token: String?
    private var userId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.register(CollectionViewCards.self, forCellWithReuseIdentifier: "collectionViewCards")
        setupConstraints()
        let userDefaults = UserDefaults.standard
        token = userDefaults.string(forKey: "acsessToken")
        userId = userDefaults.string(forKey: "keyUserID")
        addPhotos()
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
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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

