//
//  CollectionViewCell.swift
//  Seminar_4
//
//  Created by Николай Чупреев on 11.12.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    private var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height))
        imageView.image = UIImage(systemName: "person")
        addSubview(imageView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}


