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
        let titleColor = UIColor(named: "titleGrey")!
        let buttonsColor = UIColor(named: "subtitleGrey")!

        let addAlert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        setTitle(for: addAlert, withText: titleText, withColor: titleColor)
        addField(to: addAlert, withPlaceholder: placeholderText)
        addCancelButton(to: addAlert, withTitle: cancelButtonText)
        addOkButton(to: addAlert, withTitle: confirmButtonText)
        setButtons(color: buttonsColor, for: addAlert)
        self.present(addAlert, animated: true)
    }

    private func setTitle(for alert: UIAlertController, withText title: String, withColor color: UIColor) {
        let attributedString = NSAttributedString(string: title, attributes: [
        NSAttributedString.Key.foregroundColor: color
        ])
        alert.setValue(attributedString, forKey: "attributedTitle")
    }

    private func addField(to alert: UIAlertController, withPlaceholder placeholder: String) {
        alert.addTextField { textField in
            textField.placeholder = placeholder
        }
    }

    private func addCancelButton(to alert: UIAlertController, withTitle title: String) {
        alert.addAction(UIAlertAction(title: title, style: .cancel, handler: nil))
    }

    private func addOkButton(to alert: UIAlertController, withTitle title: String) {
        alert.addAction(UIAlertAction(title: title, style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            let textFieldText = textField!.text
            print(textFieldText!)
        }))
    }

    private func setButtons(color: UIColor, for alert: UIAlertController) {
        alert.view.tintColor = color
    }
}
