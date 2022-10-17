//
//  MenuTableViewCell.swift
//  PizzaShop
//
//  Created by Valeriya Trofimova on 13.10.2022.
//

import UIKit

final class MenuTableViewCell: UITableViewCell {

    let pictureView: UIImageView = {
        let pictureView = UIImageView()
        pictureView.toAutoLayout()
        pictureView.contentMode = .scaleAspectFit
        return pictureView
    }()
    
    let priceButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.setTitleColor(.newRedColor, for: .normal)
        button.layer.borderColor = UIColor.newRedColor.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 6
        button.titleLabel?.font = .displayRegular13()
        return button
    }()
    
    var nameLabel = UILabel(font: .displaySemibold17())
    let ingredients = UILabel(font: .displayRegular13(), textColor: .gray)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Views
extension MenuTableViewCell{
    
    private func setupViews() {
        
        contentView.addSubviews(pictureView,
                                nameLabel,
                                ingredients,
                                priceButton)
        
        ingredients.numberOfLines = 0
        ingredients.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        NSLayoutConstraint.activate([
            
            pictureView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            pictureView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            pictureView.widthAnchor.constraint(equalToConstant: 132),
            pictureView.heightAnchor.constraint(equalTo: pictureView.widthAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            nameLabel.leadingAnchor.constraint(equalTo: pictureView.trailingAnchor, constant: 32),
            
            ingredients.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            ingredients.leadingAnchor.constraint(equalTo: pictureView.trailingAnchor, constant: 32),
            ingredients.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            priceButton.topAnchor.constraint(equalTo: ingredients.bottomAnchor, constant: 16),
            priceButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            priceButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
            priceButton.widthAnchor.constraint(equalToConstant: 87),
            priceButton.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
}

extension MenuTableViewCell {
    
    func setCornerRadius(forIndexPath indexPath: IndexPath, cornerRadius: Double) {
        if indexPath.row == 0 {
            self.layer.cornerRadius = CGFloat(cornerRadius)
            self.clipsToBounds = true
            self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
    }
}



