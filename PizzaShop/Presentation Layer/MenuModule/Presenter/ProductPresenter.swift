//
//  ProductPresenter.swift
//  PizzaShop
//
//  Created by Valeriya Trofimova on 14.10.2022.
//

import Foundation
import UIKit

protocol ProductViewProtocol: AnyObject {
    func success()
    func get(pizaImages: [UIImage], stockImages: [UIImage])
}

protocol ProductViewPresenterProtocol: AnyObject {
    init(view: ProductViewProtocol, networkService: NetworkDataFetcherProtocol, photos: PizzaStorage)
    
    func getResponse()
    func showImage()
    var productStore: [Pizza]? { get set }
}

class ProductPresenter: ProductViewPresenterProtocol {
    
    weak var view: ProductViewProtocol?
    let networkService: NetworkDataFetcherProtocol!
    private let photos: PizzaStorage
    var productStore: [Pizza]?
   
    required init(view: ProductViewProtocol, networkService: NetworkDataFetcherProtocol, photos: PizzaStorage) {
        self.view = view
        self.networkService = networkService
        self.photos = photos
        getResponse()
        showImage()
    }
    
    func getResponse() {
        let url = URLStringInfo.productURL
        networkService.fetchPhones(urlString: url, responce: { [weak self] (phonshResponse) in
            guard let phonshResponse = phonshResponse else { return }
            self?.productStore = phonshResponse.pizza
            self?.view?.success()
        })
    }
    
    func showImage() {
        let pizza = photos.pizzaPhotos.pizzaImage
        let stock = photos.pizzaPhotos.stockImage
        view?.get(pizaImages: pizza, stockImages: stock)
    }
}


