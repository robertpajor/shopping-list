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
        let titleText = "Add new list"
        let placeholderText = "List name"
        let confirmButtonText = "OK"
        let cancelButtonText = "Cancel"

        let addAlert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        addAlert.setValue(getAttributedString(for: titleText), forKey: "attributedTitle")

        addAlert.addTextField { (textField) in
            textField.placeholder = placeholderText
        }

        addAlert.addAction(UIAlertAction(title: cancelButtonText, style: .cancel, handler: nil))
        addAlert.addAction(UIAlertAction(title: confirmButtonText, style: .default, handler: { [weak addAlert] (_) in
            let textField = addAlert?.textFields![0]
            let textFieldText = textField!.text
            print(textFieldText!)
        }))
        addAlert.view.tintColor = UIColor(named: "subtitleGrey")

        self.present(addAlert, animated: true)
    }

    private func getAttributedString(for text: String) -> NSAttributedString {
        let attributedString = NSAttributedString(string: text, attributes: [
            NSAttributedString.Key.foregroundColor: UIColor(named: "titleGrey")!
            ])
        return attributedString
    }
}
