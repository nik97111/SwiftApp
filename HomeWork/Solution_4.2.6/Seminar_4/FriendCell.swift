
//
//  Created by Николай Чупреев on 18.12.2023.
//

import UIKit

class FriendCell: UITableViewCell {
    let titleLabel = UILabel()
    let onlineStatusLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(onlineStatusLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        onlineStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
//            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
//            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            onlineStatusLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            onlineStatusLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            onlineStatusLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}

