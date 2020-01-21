//
//  ProductFormVC.swift
//  ShoppingList
//
//  Created by Robert Pajor on 05/12/2019.
//  Copyright © 2019 Robert Pajor. All rights reserved.
//

import UIKit

class ProductFormVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let categories: [String] = ["Fruits", "Vegetables", "Dairy", "Bread", "Drinks", "Accessories"]

    var shoppingList: SchoppingList
    lazy var nameField: UITextField = UITextField()
    lazy var nameSeparator: UIView = UIView()
    lazy var categoryField: UITextField = UITextField()
    lazy var categoryPicker: UIPickerView = UIPickerView()
    lazy var categorySeparator: UIView = UIView()
    lazy var quantityField: UITextField = UITextField()
    lazy var quantitySeparator: UIView = UIView()
    lazy var unitField: UITextField = UITextField()
    lazy var unitSeparator: UIView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add product"
        view.backgroundColor = .white
        initNameField()
        initNameSeparator()
        initCategoryField()
        initCategoryPicker()
        initCategorySeparator()
        initQuantityField()
        initQuantitySeparate()
        initUnitField()
        initUnitSeparate()
        addConstraints()
    }

    init(for shoppingList: SchoppingList) {
        self.shoppingList = shoppingList
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initNameField() {
        nameField.placeholder = "Name"
        nameField.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(nameField)
    }

    func initNameSeparator() {
        nameSeparator.backgroundColor = .separatorGrey
        nameSeparator.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(nameSeparator)
    }

    func initCategoryField() {
        categoryField.placeholder = "Category"
        categoryField.inputView = categoryPicker
        categoryField.doneAccessory = true
        categoryField.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(categoryField )
    }

    func initCategoryPicker() {
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        categoryPicker.backgroundColor = .white
    }

    func initCategorySeparator() {
        categorySeparator.backgroundColor = .separatorGrey
        categorySeparator.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(categorySeparator)
    }

    func initQuantityField() {
        quantityField.placeholder = "Quantity"
        quantityField.translatesAutoresizingMaskIntoConstraints = false
        quantityField.keyboardType = .numberPad
        self.view.addSubview(quantityField)
    }

    func initQuantitySeparate() {
        quantitySeparator.backgroundColor = .separatorGrey
        quantitySeparator.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(quantitySeparator)
    }

    func initUnitField() {
        unitField.placeholder = "Unit"
        unitField.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(unitField)
    }

    func initUnitSeparate() {
        unitSeparator.backgroundColor = .separatorGrey
        unitSeparator.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(unitSeparator)
    }

    func addConstraints() {
        var constraints: [NSLayoutConstraint] = []
        let textFields = [nameField, categoryField, quantityField, unitField]
        let separators = [nameSeparator, categorySeparator, quantitySeparator, unitSeparator]

        textFields.forEach { (textField) in
            constraints += [
                textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20)
            ]
        }

        separators.forEach { (separator) in
            constraints += [
                separator.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                separator.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                separator.heightAnchor.constraint(equalToConstant: 0.5)
            ]
        }
        constraints += [
            nameField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameSeparator.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 10),
            categoryField.topAnchor.constraint(equalTo: nameSeparator.bottomAnchor, constant: 10),
            categorySeparator.topAnchor.constraint(equalTo: categoryField.bottomAnchor, constant: 10),
            quantityField.topAnchor.constraint(equalTo: categorySeparator.bottomAnchor, constant: 10),
            quantitySeparator.topAnchor.constraint(equalTo: quantityField.bottomAnchor, constant: 10),
            unitField.topAnchor.constraint(equalTo: quantitySeparator.bottomAnchor, constant: 10),
            unitSeparator.topAnchor.constraint(equalTo: unitField.bottomAnchor, constant: 10)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.categoryField.text = self.categories[row]
    }
}
