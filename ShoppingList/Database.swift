//
//  DataBaseMock.swift
//  ShoppingList
//
//  Created by Robert Pajor on 06/12/2019.
//  Copyright © 2019 Robert Pajor. All rights reserved.
//

import Foundation

class Database {
    var shoppingListAray: [ShoppingList] = []
    var categories: [Category] = [Category(name: "Fruits", iconName: "fruits"),
                                  Category(name: "Vegetables", iconName: "vegetables"),
                                  Category(name: "Dairy", iconName: "dairy"),
                                  Category(name: "Bread", iconName: "bread"),
                                  Category(name: "Drinks", iconName: "drinks"),
                                  Category(name: "Accessories", iconName: "accessories")]

    func add(product: Product, toShoppingListAtIndex index: Int) {
        var shoppingList = shoppingListAray[index]
        shoppingList.addProduct(product)
        shoppingListAray[index] = shoppingList
    }
}
