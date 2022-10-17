//
//  UIView.swift
//  PizzaShop
//
//  Created by Valeriya Trofimova on 13.10.2022.
//

import UIKit

extension UIView {
    
    func toAutoLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}
