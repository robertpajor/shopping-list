//
//  ProductCell.swift
//  ShoppingList
//
//  Created by Robert Pajor on 13/03/2020.
//  Copyright © 2020 Robert Pajor. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {
    var isCheckActive: Bool = false
    lazy var categoryImage: UIImageView = UIImageView()
    lazy var labelsContainer: UIView = UIView()
    lazy var nameLabel: UILabel = UILabel()
    lazy var unitLabel: UILabel = UILabel()
    lazy var checkImage: UIImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initCategoryImage()
        initNameLabel()
        initUnitLabel()
        initLabelsContainer()
        initCheckImage()
        addConstraint()
    }

    func initCategoryImage() {
        categoryImage.contentMode = .center
        categoryImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(categoryImage)
    }

    func initNameLabel() {
        nameLabel.textColor = .primaryGrey
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
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

    func initCheckImage() {
        setCheckState()
        checkImage.contentMode = .center
        checkImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(checkImage)
    }

    func addConstraint() {
        let constraints = [
            categoryImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            categoryImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            categoryImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            categoryImage.widthAnchor.constraint(equalToConstant: 45),
            categoryImage.heightAnchor.constraint(equalToConstant: 45),
            labelsContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            labelsContainer.leadingAnchor.constraint(equalTo: categoryImage.trailingAnchor, constant: 12),
            nameLabel.topAnchor.constraint(equalTo: labelsContainer.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: labelsContainer.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: labelsContainer.trailingAnchor),
            unitLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            unitLabel.leadingAnchor.constraint(equalTo: labelsContainer.leadingAnchor),
            unitLabel.trailingAnchor.constraint(equalTo: labelsContainer.trailingAnchor),
            unitLabel.bottomAnchor.constraint(equalTo: labelsContainer.bottomAnchor),
            checkImage.leadingAnchor.constraint(equalTo: labelsContainer.trailingAnchor, constant: 12),
            checkImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            checkImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            checkImage.widthAnchor.constraint(equalToConstant: 45),
            checkImage.heightAnchor.constraint(equalToConstant: 45)

        ]
        NSLayoutConstraint.activate(constraints)
    }

    func updateData(for product: Product) {
        nameLabel.text = product.name
        categoryImage.image = UIImage(named: product.category.iconName)

        let unit = product.unit ?? ""
        unitLabel.text = "\(product.quantity) \(unit)"
    }

    func setCheckState() {
        checkImage.image = UIImage(named: isCheckActive ? "activeCheck" : "inactiveCheck")
        isCheckActive = !isCheckActive
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
