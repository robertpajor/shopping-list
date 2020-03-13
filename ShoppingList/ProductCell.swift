//
//  ProductCell.swift
//  ShoppingList
//
//  Created by Robert Pajor on 13/03/2020.
//  Copyright © 2020 Robert Pajor. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {
    lazy var categoryImage: UIImageView = UIImageView()
    lazy var labelsContainer: UIView = UIView()
    lazy var nameLabel: UILabel = UILabel()
    lazy var unitLabel: UILabel = UILabel()
    lazy var doneImage: UIImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initCategoryImage()
        initNameLabel()
        initUnitLabel()
        initLabelsContainer()
        initDoneImage()
        addConstraint()
    }

    func initCategoryImage() {
        categoryImage.image = UIImage(named: "dairy")
        categoryImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(categoryImage)
    }

    func initNameLabel() {
        nameLabel.textColor = .primaryGrey
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        labelsContainer.addSubview(nameLabel)
    }

    func initUnitLabel() {
        unitLabel.textColor = .secondaryGrey
        unitLabel.translatesAutoresizingMaskIntoConstraints = false
        labelsContainer.addSubview(unitLabel)
    }

    func initLabelsContainer() {
        labelsContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(labelsContainer)
    }

    func initDoneImage() {
        doneImage.image = UIImage(named: "done_0")
        doneImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(doneImage)
    }

    func addConstraint() {
        let constraints = [
            categoryImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            categoryImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            categoryImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            categoryImage.widthAnchor.constraint(equalToConstant: 60),
            categoryImage.heightAnchor.constraint(equalToConstant: 60),
            labelsContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            labelsContainer.leadingAnchor.constraint(equalTo: categoryImage.trailingAnchor, constant: 12),
            nameLabel.topAnchor.constraint(equalTo: labelsContainer.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: labelsContainer.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: labelsContainer.trailingAnchor),
            unitLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            unitLabel.leadingAnchor.constraint(equalTo: labelsContainer.leadingAnchor),
            unitLabel.trailingAnchor.constraint(equalTo: labelsContainer.trailingAnchor),
            unitLabel.bottomAnchor.constraint(equalTo: labelsContainer.bottomAnchor),
            doneImage.leadingAnchor.constraint(equalTo: labelsContainer.trailingAnchor, constant: 12),
            doneImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            doneImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            doneImage.widthAnchor.constraint(equalToConstant: 40),
            doneImage.heightAnchor.constraint(equalToConstant: 40)

        ]
        NSLayoutConstraint.activate(constraints)
    }

    func updateData(for product: Product) {
        nameLabel.text = product.name

        let unit = product.unit ?? ""
        unitLabel.text = "\(product.quantity) \(unit)"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
