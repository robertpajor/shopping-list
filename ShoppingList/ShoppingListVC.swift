//
//  ShoppingListVC.swift
//  ShoppingList
//
//  Created by Robert Pajor on 24/07/2019.
//  Copyright © 2019 Robert Pajor. All rights reserved.
//

import UIKit

class ShoppingListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var namesList: [String] = [] {
        didSet {
            mainListTableView.isHidden = namesList.isEmpty
            mainListTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainList()
    }

    @IBOutlet weak var mainListTableView: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainListCell", for: indexPath)
        cell.textLabel?.text = "\(namesList[indexPath.row])"
        cell.textLabel?.textColor = .primaryGrey
        return cell
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
            self?.namesList.append(text)
        }
        self.present(addAlert, animated: true)
    }

    private func setupMainList() {
        mainListTableView.isHidden = true
        mainListTableView.tableFooterView = UIView()
        mainListTableView.allowsSelection = false
        mainListTableView.rowHeight = 45
    }
}
