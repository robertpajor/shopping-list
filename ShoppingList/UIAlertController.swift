//
//  UIAlertController.swift
//  ShoppingList
//
//  Created by Robert Pajor on 14/10/2019.
//  Copyright © 2019 Robert Pajor. All rights reserved.
//

import UIKit

extension UIAlertController {

    static func make() -> UIAlertController {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        alert.view.tintColor = .secondaryGrey
        return alert
    }

    func setTitle(withText title: String) {
        let attributedString = NSAttributedString(string: title, attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.primaryGrey!
        ])
        self.setValue(attributedString, forKey: "attributedTitle")
    }

    func addField(withPlaceholder placeholder: String) {
        self.addTextField { textField in
            textField.placeholder = placeholder
        }
    }

    func addCancelButton(withHandler handler: Void?) {
        self.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(_) in
            guard let handler = handler else { return }
            handler
        }))
    }

    func addOkButton(withHandler handler: ((String) -> Void)? = nil) {
        self.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] (_) in
            guard let handler = handler else { return }
            let textField = self?.textFields![0]
            let textFieldText = textField!.text
            handler(textFieldText!)
        }))
    }
}
