//
//  NetworkDataFeatcher.swift
//  PizzaShop
//
//  Created by Valeriya Trofimova on 14.10.2022.
//

import Foundation

protocol NetworkDataFetcherProtocol {
    func fetchPhones(urlString: String, responce: @escaping (FoodModel?) -> Void)
}

final class NetworkDataFetcher: NetworkDataFetcherProtocol {
    
    let networkService = NetworkService()
    
    func fetchPhones(urlString: String, responce: @escaping (FoodModel?) -> Void) {
        networkService.request(urlString: urlString) { (result) in
            switch result {
            case.success(let data):
                do {
                    let phones = try JSONDecoder().decode(FoodModel.self, from: data)
                    responce(phones)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    responce(nil)
                }
            case .failure(let error):
                print("Error received requesting data \(error.localizedDescription)")
                responce(nil)
            }
        }
    }
}
