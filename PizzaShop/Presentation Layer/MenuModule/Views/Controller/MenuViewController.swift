//
//  MenuViewController.swift
//  PizzaShop
//
//  Created by Valeriya Trofimova on 13.10.2022.
//

import UIKit

final class MenuViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    private let identifierCellOne = "idCellOne"
    private let identifierCellTwo = "idCellTwo"
    
    var presenter: ProductViewPresenterProtocol!
    var searchResponse: FoodModel? = nil
    let networkDataFetcher  = NetworkDataFetcher()
    
    private var buttonActive = false
    private var titlaLabel = UILabel(text: "Москва", font: .displayMedium17(), textColor: .black)
    
    private lazy var barButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(actionBarButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var actionBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(customView: barButton)
    }()
    
    private var pizzaSource: [UIImage]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var stockSource: [UIImage]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupNavigationBar()
    }
    
    // MARK: - Setup TableView
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.toAutoLayout()
        tableView.backgroundColor = .newGrayColor
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(StockTableViewCell.self, forCellReuseIdentifier: identifierCellOne)
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: identifierCellTwo)
        tableView.register(MenuTableHeaderView.self, forHeaderFooterViewReuseIdentifier: MenuTableHeaderView.headerId)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    //MARK: Navigation action
    @objc private func actionBarButtonTapped() {
        buttonActive ? barButton.setImage(UIImage(systemName: "chevron.up"), for: .normal) : barButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        buttonActive = !buttonActive
        
        print("TAP")
    }
    
    private func setupNavigationBar() {
        let button = UIBarButtonItem(customView: titlaLabel)
        navigationItem.leftBarButtonItems = [button, actionBarButtonItem]
    }
}

// MARK: - UITableViewDataSource
extension MenuViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return presenter.productStore?.count ?? 0
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var newCell = UITableViewCell()
        
        let section = indexPath.section
        switch section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: identifierCellOne, for: indexPath) as! StockTableViewCell
            cell.stockSource = stockSource
            
            newCell = cell
            return newCell
        case 1:
            
            let productStore = presenter.productStore?[indexPath.row]
            let images = pizzaSource?[indexPath.row]
            
            let cell = tableView.dequeueReusableCell(withIdentifier: identifierCellTwo, for: indexPath) as! MenuTableViewCell
            
            cell.setCornerRadius(forIndexPath: indexPath, cornerRadius: 30)
            
            cell.nameLabel.text = productStore?.name
            cell.ingredients.text = productStore?.description
            cell.priceButton.setTitle("\(productStore?.price ?? 0) р", for: .normal)
            cell.pictureView.image = images
            
            newCell = cell
            return newCell
            
        default:
            break
        }
        
        return newCell
    }
}

// MARK: UITableViewDelegate
extension MenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard section == 1 else { return nil }
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: MenuTableHeaderView.headerId) as! MenuTableHeaderView
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        guard section == 1 else { return 0 }
        return MenuTableHeaderView.noIntrinsicMetric
    }
}

// MARK: - ProductViewProtocol
extension MenuViewController: ProductViewProtocol {
    
    func get(pizaImages: [UIImage], stockImages: [UIImage]) {
        pizzaSource = pizaImages
        stockSource = stockImages
    }
    
    func success() {
        tableView.reloadData()
    }
}
