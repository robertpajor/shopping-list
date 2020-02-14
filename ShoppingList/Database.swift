//
//  DataBaseMock.swift
//  ShoppingList
//
//  Created by Robert Pajor on 06/12/2019.
//  Copyright © 2019 Robert Pajor. All rights reserved.
//

import Foundation

class Database {
    var shoppingListAray: [SchoppingList] = [SchoppingList(withName: "List 1")]
    let categories: [String] = ["Fruits", "Vegetables", "Dairy", "Bread", "Drinks", "Accessories"]
    let units: [String] = ["pieces", "liters", "kilograms", "decagrams", "grams"]
}
