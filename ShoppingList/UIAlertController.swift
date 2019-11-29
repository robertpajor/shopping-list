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

    func addField(withText text: String? = nil, withPlaceholder placeholder: String? = nil) {
        self.addTextField { textField in
            textField.text = text
            textField.placeholder = placeholder
        }
    }

    func addCancelButton(withHandler handler: (() -> Void)?) {
        self.addAction(UIAlertAction(title: "Cancel", style: .cancel) { (_) in
            handler?()
        })
    }

    func addOkButton(withHandler handler: ((String) -> Void)?) {
        self.addAction(UIAlertAction(title: "OK", style: .default) { [weak self] (_) in
            let text = self?.textFields?[0].text ?? ""
            handler?(text)
        })
    }
}
