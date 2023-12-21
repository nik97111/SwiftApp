
//
//  Created by Николай Чупреев on 11.12.2023.
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
