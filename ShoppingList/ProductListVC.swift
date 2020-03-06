//
//  ProductListVC.swift
//  ShoppingList
//
//  Created by Robert Pajor on 06/03/2020.
//  Copyright © 2020 Robert Pajor. All rights reserved.
//

import UIKit

class ProductListVC: UIViewController {
    var database: Database
    var shoppingListIndex: Int
    lazy var emptyListLabel: UILabel = UILabel()

    override func viewDidLoad() {
        initView()
        initEmptyListLabel()
        addConstraints()
    }

    init(forShoppingListIndex index: Int, in database: Database) {
        self.shoppingListIndex = index
        self.database = database
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initView() {
        view.backgroundColor = .white
        title = database.shoppingListAray[shoppingListIndex].name
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self,
                                                            action: #selector(addProduct))
    }

    func initEmptyListLabel() {
        emptyListLabel.text = "Please add first product"
        emptyListLabel.textColor = .secondaryGrey
        emptyListLabel.textAlignment = .center
        emptyListLabel.font = .systemFont(ofSize: 30)
        emptyListLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emptyListLabel)
    }
    @objc func addProduct() {
        print("Add button")
        let productFormVC = ProductFormVC(forShoppingListIndex: shoppingListIndex, in: database)
        navigationController?.pushViewController(productFormVC, animated: true)

    }

    func addConstraints() {
        let constraints = [
            emptyListLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0),
            emptyListLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emptyListLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emptyListLabel.heightAnchor.constraint(equalToConstant: 60)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
