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
    var listIndex: Int
    lazy var emptyListLabel: UILabel = UILabel()
    lazy var productsTable: UITableView = UITableView()

    override func viewDidLoad() {
        initView()
        initEmptyListLabel()
        initProductsTable()
        addConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emptyListLabel.isHidden = !isEmptyList()
        productsTable.isHidden = isEmptyList()
        productsTable.reloadData()
    }

    init(forShoppingListIndex index: Int, in database: Database) {
        self.listIndex = index
        self.database = database
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initView() {
        view.backgroundColor = .white
        title = database.shoppingListAray[listIndex].name
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

    func initProductsTable() {
        productsTable.register(ProductCell.self, forCellReuseIdentifier: "productCell")
        productsTable.dataSource = self
        productsTable.tableFooterView = UIView()
        productsTable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(productsTable)
    }

    @objc func addProduct() {
        let productFormVC = ProductFormVC(forShoppingListIndex: listIndex, in: database)
        navigationController?.pushViewController(productFormVC, animated: true)

    }

    func addConstraints() {
        let constraints = [
            emptyListLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0),
            emptyListLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emptyListLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emptyListLabel.heightAnchor.constraint(equalToConstant: 60),
            productsTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            productsTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            productsTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            productsTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    private func isEmptyList() -> Bool {
        return database.shoppingListAray[listIndex].products.isEmpty
    }
}

extension ProductListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        database.shoppingListAray[listIndex].products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) // as! ProductCell
        cell.textLabel?.text = database.shoppingListAray[listIndex].products[indexPath.row].name
        return cell
    }
}

class ProductCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
