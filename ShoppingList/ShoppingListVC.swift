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
        let addAlert = UIAlertController(title: "", message: "", preferredStyle: .alert)

        let attributedString = NSAttributedString(string: "Add new list", attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17),
            NSAttributedString.Key.foregroundColor: UIColor(named: "titleGrey")!
            ])
        addAlert.setValue(attributedString, forKey: "attributedTitle")

        addAlert.addTextField { (textField) in
            textField.placeholder = "List name"
        }

        addAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        addAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak addAlert] (_) in
            let textField = addAlert?.textFields![0]
            let textFieldText = textField!.text
            print(textFieldText!)
        }))
        addAlert.view.tintColor = UIColor(named: "subtitleGrey")
        self.present(addAlert, animated: true)
    }

//    private func getAttributedString(for text: String) -> NSAttributedString {
//        let attributedString = NSAttributedString(string: text, attributes: [
//            NSAttributedString.Key.foregroundColor: UIColor(named: "titleGrey")
//            ])
//        return attributedString
//    }



    
    // MARK: - Table view data source

/*    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }*/
}
