//
//  MainTabBarController.swift
//  PizzaShop
//
//  Created by Valeriya Trofimova on 13.10.2022.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    let menuImage = UIImage(systemName: "takeoutbag.and.cup.and.straw.fill", withConfiguration: UIImage.SymbolConfiguration(weight: .medium))
    let contactsImage = UIImage(systemName: "mappin.and.ellipse", withConfiguration: UIImage.SymbolConfiguration(weight: .medium))
    let profileImage = UIImage(systemName: "person.fill", withConfiguration: UIImage.SymbolConfiguration(weight: .medium))
    let basketImage = UIImage(systemName: "cart.fill", withConfiguration: UIImage.SymbolConfiguration(weight: .medium))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateTabBar()
        
        viewControllers = [
            generateVC(rootViewController: generateMenuVC(), title: "Меню", image: menuImage),
            generateVC(rootViewController: ContactsViewController(), title: "Контакты", image: contactsImage),
            generateVC(rootViewController: ProfileViewController(), title: "Профиль", image: profileImage),
            generateVC(rootViewController: BasketViewController(), title: "Корзина", image: basketImage)
        ]
    }
    
    private func generateMenuVC() -> UIViewController {
        let view = MenuViewController()
        let networkService = NetworkDataFetcher()
        let photos = PizzaStorage()
        let presenter = ProductPresenter(view: view, networkService: networkService, photos: photos)
        view.presenter = presenter
        return view
    }
    
    private func generateVC(rootViewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        
        return navigationVC
    }
    
    private func generateTabBar() {
        tabBar.tintColor = .newRedColor
        tabBar.unselectedItemTintColor = .gray
    }
}

