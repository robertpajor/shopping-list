//
//  List.swift
//  ShoppingList
//
//  Created by Robert Pajor on 06/12/2019.
//  Copyright © 2019 Robert Pajor. All rights reserved.
//

import Foundation

class SchoppingList {
    var name: String
    var products: [Product]

    init(withName name: String, products: [Product] = []) {
        self.name = name
        self.products = products
    }
}

class Product {
    var name: String
    var category: String
    var quantity: Float
    var unit: String?

    init(name: String, category: String, quantity: Float, unit: String?) {
        self.name = name
        self.category = category
        self.quantity = quantity
        self.unit = unit
    }
}
