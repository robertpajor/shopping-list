//
//  List.swift
//  ShoppingList
//
//  Created by Robert Pajor on 06/12/2019.
//  Copyright © 2019 Robert Pajor. All rights reserved.
//

import Foundation

struct ShoppingList {
    var name: String
    var products: [Product] = []

    mutating func addProduct(_ product: Product) {
        products.append(product)
    }
}

struct Product {
    var name: String
    var category: String
    var quantity: Float
    var unit: String?
}
