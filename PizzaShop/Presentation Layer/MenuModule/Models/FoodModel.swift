//
//  FoodModel.swift
//  PizzaShop
//
//  Created by Valeriya Trofimova on 14.10.2022.
//

import Foundation

struct FoodModel: Codable {
    let pizza: [Pizza]
}

struct Pizza: Codable {    
    let name: String
    let description: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "nameRu"
        case description, price
    }
}
