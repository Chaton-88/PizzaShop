//
//  CustomButton.swift
//  PizzaShop
//
//  Created by Valeriya Trofimova on 15.10.2022.
//

import UIKit

final class CustomButton: UIButton {
    
    var buttonAction: (() -> Void)?
    
    init(title: String) {
        super.init(frame: .zero)
        
        self.toAutoLayout()
        self.setTitle(title, for: .normal)
        self.setTitleColor(.newLightRedColor, for: .normal)
        self.titleLabel?.font = .displayRegular13()
        self.layer.borderColor = UIColor.newLightRedColor.cgColor
        self.layer.cornerRadius = 16
        self.layer.borderWidth = 1
        self.clipsToBounds = true
        
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func buttonTapped() {
        self.setTitleColor(.newRedColor, for: .normal)
        self.layer.borderColor = UIColor.newRedColor.cgColor
        self.backgroundColor = .newLightRedColor
        self.titleLabel?.font = .displaySemibold13()
        
        buttonAction?()
    }
}

