//
//  PizzaStorage.swift
//  PizzaShop
//
//  Created by Valeriya Trofimova on 14.10.2022.
//

import UIKit

struct PizzaStorage {
    
    let pizzaPhotos = PizzaPhoto(pizzaImage: [UIImage(named: "Pizza2") ?? UIImage(),
                                              UIImage(named: "Pizza1") ?? UIImage(),
                                              UIImage(named: "Pizza3") ?? UIImage(),
                                              UIImage(named: "Pizza2") ?? UIImage(),
                                              UIImage(named: "Pizza1") ?? UIImage(),
                                              UIImage(named: "Pizza3") ?? UIImage()
                                             ],
                                 stockImage: [UIImage(named: "Stock1") ?? UIImage(),
                                              UIImage(named: "Stock2") ?? UIImage(),
                                              UIImage(named: "Stock3") ?? UIImage(),
                                             ])
}


