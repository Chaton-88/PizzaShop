//
//  StockCollectionViewCell.swift
//  PizzaShop
//
//  Created by Valeriya Trofimova on 14.10.2022.
//

import UIKit

final class StockCollectionViewCell: UICollectionViewCell {
    
    static var reuseIdentifer = "cellIdentifer"
    
    var pictureView: UIImageView = {
        let pictureView = UIImageView()
        pictureView.toAutoLayout()
        pictureView.contentMode = .scaleToFill
        pictureView.clipsToBounds = true
        pictureView.layer.cornerRadius = 10
        return pictureView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Views
extension StockCollectionViewCell {
    
    private func setupConstraint() {
        
        contentView.addSubview(pictureView)
        
        NSLayoutConstraint.activate([
            
            pictureView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .zero),
            pictureView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .zero),
            pictureView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: .zero),
            pictureView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: .zero),
        ])
    }
}





