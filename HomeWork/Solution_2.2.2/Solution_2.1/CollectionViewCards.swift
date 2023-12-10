
//  Created by Николай Чупреев on 09.12.2023.
//

import UIKit

class CollectionViewCards: UICollectionViewCell {
    var imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height))
        contentView.addSubview(imageView)
        imageView.layer.cornerRadius = 5
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.black.cgColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

