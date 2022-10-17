//
//  UILabel.swift
//  PizzaShop
//
//  Created by Valeriya Trofimova on 13.10.2022.
//

import UIKit

extension UILabel{
    
    convenience init(text: String = "", font: UIFont?, textColor: UIColor = .black) {
        self.init()
        
        self.text = text
        self.font = font
        self.textColor = textColor
        self.adjustsFontSizeToFitWidth = true
        self.toAutoLayout()
        self.textAlignment = .left
    }
}

