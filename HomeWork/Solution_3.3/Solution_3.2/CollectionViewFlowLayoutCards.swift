//
//  CollectionViewFlowLayoutCards.swift
//  Solution_3.2
//
//  Created by Николай Чупреев on 09.12.2023.
//

import UIKit

class CollectionViewFlowLayoutCards: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        itemSize = CGSize(width: 190, height: 140)
    }
}
