//
//  StockTableViewCell.swift
//  PizzaShop
//
//  Created by Valeriya Trofimova on 14.10.2022.
//

import UIKit

final class StockTableViewCell: UITableViewCell {
    
    private let layout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    var stockSource: [UIImage]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StockTableViewCell {
    
    // MARK: - Configuration
    private func setupCollectionView() {
        collectionView.backgroundColor = .newGrayColor
        collectionView.toAutoLayout()
        collectionView.dataSource = self
        collectionView.delegate = self
        layout.scrollDirection = .horizontal
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(StockCollectionViewCell.self, forCellWithReuseIdentifier: StockCollectionViewCell.reuseIdentifer)
    }
    
    private func setupUI() {
        contentView.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 112),
        ])
    }
}

// MARK: - UICollectionViewDataSource
extension StockTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StockCollectionViewCell.reuseIdentifer, for: indexPath) as! StockCollectionViewCell
        cell.pictureView.image = stockSource?[indexPath.item]
       
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension StockTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return indentSide
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: .zero, left: indentSide, bottom: .zero, right: indentSide)
    }
}

// MARK: Helpers
extension StockTableViewCell {
    private var indentSide: CGFloat { return 16 }
}



