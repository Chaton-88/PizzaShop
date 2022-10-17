//
//  MenuTableHeaderView.swift
//  PizzaShop
//
//  Created by Valeriya Trofimova on 15.10.2022.
//

import UIKit

class MenuTableHeaderView: UITableViewHeaderFooterView {
    
    static let headerId = String(describing: MenuTableHeaderView.self)
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.toAutoLayout()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.alwaysBounceHorizontal = true
        return scrollView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.toAutoLayout()
        stackView.spacing = 8
        return stackView
    }()
    
    private let pizzaButton = CustomButton(title: "Пицца")
    private let comboButton = CustomButton(title: "Комбо")
    private let dessertsButton = CustomButton(title: "Десерты")
    private let drinksButton = CustomButton(title: "Напитки")
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .newGrayColor
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - SetConstraints
extension MenuTableHeaderView {
    
    private func setConstraints() {
        
        addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor,constant: .zero),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: .zero),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: .zero),
            scrollView.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        scrollView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: .zero),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: .zero),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: .zero),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor,constant: -24),
            stackView.heightAnchor.constraint(equalToConstant: 32)
        ])
        
        stackView.addArrangedSubview(pizzaButton)
        stackView.addArrangedSubview(comboButton)
        stackView.addArrangedSubview(dessertsButton)
        stackView.addArrangedSubview(drinksButton)
        
        NSLayoutConstraint.activate([
            pizzaButton.widthAnchor.constraint(equalToConstant: 88),
            comboButton.widthAnchor.constraint(equalTo: pizzaButton.widthAnchor),
            dessertsButton.widthAnchor.constraint(equalTo: pizzaButton.widthAnchor),
            drinksButton.widthAnchor.constraint(equalTo: pizzaButton.widthAnchor)
        ])
    }
}
