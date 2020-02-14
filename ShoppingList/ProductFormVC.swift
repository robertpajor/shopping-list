//
//  ProductFormVC.swift
//  ShoppingList
//
//  Created by Robert Pajor on 05/12/2019.
//  Copyright © 2019 Robert Pajor. All rights reserved.
//

import UIKit

class ProductFormVC: UIViewController {
    var database = Database()
    var shoppingList: SchoppingList
    var textFields: [UITextField] {
        return [nameField, categoryField, quantityField, unitField]
        }
    var separators: [UIView] {
        return [nameSeparator, categorySeparator, quantitySeparator, unitSeparator]
    }
    lazy var nameField: UITextField = UITextField()
    lazy var nameSeparator: UIView = UIView()
    lazy var categoryField: UITextField = UITextField()
    lazy var categoryPicker: UIPickerView = UIPickerView()
    lazy var categorySeparator: UIView = UIView()
    lazy var quantityField: UITextField = UITextField()
    lazy var quantitySeparator: UIView = UIView()
    lazy var unitField: UITextField = UITextField()
    lazy var unitPicker: UIPickerView = UIPickerView()
    lazy var unitSeparator: UIView = UIView()
    lazy var addButton: UIButton = UIButton()
    lazy var categoryPickerData = PickerData(inputData: database.categories, outputTextField: categoryField)
    lazy var unitPickerData = PickerData(inputData: database.units, outputTextField: unitField)

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
        initUnitPicker()
        initUnitSeparate()
        initAddButton()
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
        nameField.doneAccessory = true
        nameField.translatesAutoresizingMaskIntoConstraints = false
        nameField.addTarget(self, action: #selector(updateAddButton), for: .editingChanged)
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
        categoryField.addTarget(self, action: #selector(updateAddButton), for: .editingChanged)
        self.view.addSubview(categoryField)
    }

    func initCategoryPicker() {
        categoryPicker.delegate = categoryPickerData
        categoryPicker.dataSource = categoryPickerData
        categoryPicker.backgroundColor = .white
    }

    func initCategorySeparator() {
        categorySeparator.backgroundColor = .separatorGrey
        categorySeparator.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(categorySeparator)
    }

    func initQuantityField() {
        quantityField.placeholder = "Quantity"
        quantityField.doneAccessory = true
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
        unitField.inputView = unitPicker
        unitField.doneAccessory = true
        unitField.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(unitField)
    }

     func initUnitPicker() {
        unitPicker.delegate = unitPickerData
        unitPicker.dataSource = unitPickerData
        unitPicker.backgroundColor = .white
    }

    func initUnitSeparate() {
        unitSeparator.backgroundColor = .separatorGrey
        unitSeparator.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(unitSeparator)
    }

    func initAddButton() {
        addButton.setTitle("Add", for: .normal)
        addButton.layer.cornerRadius = 10
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
        setAddButton(enabled: false)
        self.view.addSubview(addButton)
    }

    func addConstraints() {
        var constraints: [NSLayoutConstraint] = []
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
            unitSeparator.topAnchor.constraint(equalTo: unitField.bottomAnchor, constant: 10),
            addButton.topAnchor.constraint(equalTo: unitSeparator.bottomAnchor, constant: 80),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            addButton.heightAnchor.constraint(equalToConstant: 50)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    @objc func updateAddButton() {
        setAddButton(enabled: shouldAddButtonEnable())
    }

    @objc func addButtonAction(sender: UIButton) {
        guard let product = getProduct() else { return }

        shoppingList.products.append(product)
        clearForm()
    }

    private func getProduct() -> Product? {
        guard let productName = nameField.text,
            let category = categoryField.text,
            let textQuantity = quantityField.text,
            let numberQuantity = Float(textQuantity) else { return nil }
        return Product(name: productName, category: category, quantity: numberQuantity, unit: unitField.text)
    }

    private func shouldAddButtonEnable() -> Bool {
        return !(nameField.text?.isEmpty ?? true || categoryField.text?.isEmpty ?? true)
    }

    private func setAddButton(enabled: Bool) {
        addButton.backgroundColor = enabled ? .primaryGrey : .secondaryGrey
        addButton.isEnabled = enabled
    }

    private func clearForm() {
        textFields.forEach { (textField) in
            textField.text = ""
        }
        updateAddButton()
        self.view.endEditing(true)
    }
}

class PickerData: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {

    var inputData: [String]
    var textField: UITextField

    init(inputData: [String], outputTextField: UITextField) {
        self.inputData = inputData
        self.textField = outputTextField
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return inputData.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return inputData[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.textField.text = self.inputData[row]
    }
}
