//
//  ShoppingListVC.swift
//  ShoppingList
//
//  Created by Robert Pajor on 24/07/2019.
//  Copyright © 2019 Robert Pajor. All rights reserved.
//

import UIKit

class ShoppingListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func clickAddButton(_ sender: Any) {
        showAddAlert()
    }

    func showAddAlert() {
        let addAlert = UIAlertController.make()
        addAlert.setTitle(withText: "Add new list")
        addAlert.addField(withPlaceholder: "List name")
        addAlert.addCancelButton(withHandler: nil)
        addAlert.addOkButton { [weak self] text in
            self?.printText(text)
        }
        self.present(addAlert, animated: true)
    }

// It is temporary function
    func printText(_ text: String) {
        print(String(format: "Text from field: %@", text))
    }
}
