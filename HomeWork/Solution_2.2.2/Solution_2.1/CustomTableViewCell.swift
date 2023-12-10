
//  Created by Николай Чупреев on 09.12.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "CustomLabel"
        return label
    }()
    
    private func setupView() {
        contentView.addSubview(label)
        setupConstraints()
    }
    
    private func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant:  10),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
