//
//  DataBaseMock.swift
//  ShoppingList
//
//  Created by Robert Pajor on 06/12/2019.
//  Copyright © 2019 Robert Pajor. All rights reserved.
//

import Foundation

class Database {
    var shoppingListAray: [ShoppingList] = [ShoppingList(name: "List 1")]

    func add(product: Product, toShoppingListAtIndex index: Int) {
        var shoppingList = shoppingListAray[index]
        shoppingList.addProduct(product)
        shoppingListAray[index] = shoppingList
    }
}
