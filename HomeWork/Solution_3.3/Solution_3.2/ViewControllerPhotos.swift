//
//  ViewControllerPhotos.swift
//  Solution_3.2
//
//  Created by Николай Чупреев on 09.12.2023.
//

import UIKit

class ViewControllerPhotos: UIViewController {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: CollectionViewFlowLayoutCards())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Photos"
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.register(CollectionViewCards.self, forCellWithReuseIdentifier: "collectionViewCards")
        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewControllerPhotos: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCards", for: indexPath) as! CollectionViewCards
        cell.imageView.image = UIImage()
        return cell
    }
}

