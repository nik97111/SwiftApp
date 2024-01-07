//
//  CollectionViewFlowLayoutCards.swift
//  AppGB
//
//  Created by Николай Чупреев on 04.01.2024.
//

import UIKit

class CollectionViewFlowLayoutCards: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        scrollDirection = .vertical
        minimumLineSpacing = 20
        itemSize = CGSize(width: 120, height: 120)
    }
}
