//
//  ShoppingListVC.swift
//  ShoppingList
//
//  Created by Robert Pajor on 24/07/2019.
//  Copyright © 2019 Robert Pajor. All rights reserved.
//

import UIKit

class ShoppingListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var mainListTableView: UITableView!

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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainListCell", for: indexPath)
        cell.textLabel?.text = "\(namesList[indexPath.row])"
        cell.textLabel?.textColor = .primaryGrey
        return cell
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (_, indexPath) in
            self.namesList.remove(at: indexPath.row)
        }

        let edit = UITableViewRowAction(style: .default, title: "Edit") { (_, indexPath) in
            self.showEditAlert(forListWithIndex: indexPath.row)
        }

        edit.backgroundColor = .secondaryGrey

        return [delete, edit]

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

    func showEditAlert(forListWithIndex index: Int) {
        let editAlert = UIAlertController.make()
        editAlert.setTitle(withText: "Edit list name")
        editAlert.addField(withPreviousText: self.namesList[index])
        editAlert.addCancelButton(withHandler: nil)
        editAlert.addOkButton { [weak self] text in
            self?.namesList[index] = text
        }
        self.present(editAlert, animated: true)
    }

    private func setupMainList() {
        mainListTableView.isHidden = namesList.isEmpty
        mainListTableView.tableFooterView = UIView()
        mainListTableView.allowsSelection = false
        mainListTableView.rowHeight = 45
    }
}
