//
//  UITextField.swift
//  ShoppingList
//
//  Created by Robert Pajor on 21/01/2020.
//  Copyright © 2020 Robert Pajor. All rights reserved.
//

import UIKit

extension UITextField {

    @IBInspectable var doneAccessory: Bool {
        get { return inputAccessoryView != nil }
        set { newValue ? addDoneButtonAccessoryView() : removeDoneButtonAccessoryView() }
    }

    private func addDoneButtonAccessoryView() {
        removeDoneButtonAccessoryView()
        let inputView = UIInputView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40),
                                    inputViewStyle: .keyboard)
        inputView.backgroundColor = .white

        let doneButton = makeDoneButton()
        let line = makeLine()
        inputView.addSubview(doneButton)
        inputView.addSubview(line)

        NSLayoutConstraint.activate([
            doneButton.trailingAnchor.constraint(equalTo: inputView.trailingAnchor, constant: -4),
            doneButton.centerYAnchor.constraint(equalTo: inputView.centerYAnchor, constant: 0),
            line.bottomAnchor.constraint(equalTo: inputView.bottomAnchor, constant: 0),
            line.trailingAnchor.constraint(equalTo: inputView.trailingAnchor, constant: 0),
            line.leadingAnchor.constraint(equalTo: inputView.leadingAnchor, constant: 0),
            line.heightAnchor.constraint(equalToConstant: 0.5)
        ])

        inputAccessoryView = inputView
    }

    private func removeDoneButtonAccessoryView() {
        inputAccessoryView = nil
    }

    private func makeDoneButton() -> UIButton {
        let button = UIButton()
        button.contentEdgeInsets = .init(top: 0, left: 12, bottom: 0, right: 12)
        button.setTitle("Done", for: .normal)
        button.setTitleColor(.primaryGrey, for: .normal)
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(resignFirstResponder), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }

    private func makeLine() -> UIView {
        let line = UIView()
        line.backgroundColor = .separatorGrey
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }
}
