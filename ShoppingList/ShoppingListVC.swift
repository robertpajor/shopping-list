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
    var database = Database()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainList()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return database.shoppingListAray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainListCell", for: indexPath)
        let listName = getListName(withIndex: indexPath.row)
        cell.textLabel?.text = "\(listName)"
        cell.textLabel?.textColor = .primaryGrey
        return cell
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (_, indexPath) in
            self.removeList(withIndex: indexPath.row)
        }

        let edit = UITableViewRowAction(style: .default, title: "Edit") { (_, indexPath) in
            self.showEditAlert(forItemAt: indexPath.row)
        }

        edit.backgroundColor = .secondaryGrey

        return [delete, edit]
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let productForm = ProductFormVC()
        navigationController?.pushViewController(productForm, animated: true)
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
            self?.addList(withName: text)
        }
        self.present(addAlert, animated: true)
    }

    func showEditAlert(forItemAt index: Int) {
        let editAlert = UIAlertController.make()
        editAlert.setTitle(withText: "Edit list name")
        editAlert.addField(withText: self.getListName(withIndex: index), withPlaceholder: "List name")
        editAlert.addCancelButton(withHandler: nil)
        editAlert.addOkButton { [weak self] text in
            self?.editList(withIndex: index, newName: text)
        }
        self.present(editAlert, animated: true)
    }

    private func addList(withName name: String) {
        database.shoppingListAray.append(SchoppingList(withName: name))
        updateContent()
    }

    private func editList(withIndex index: Int, newName name: String) {
        database.shoppingListAray[index].name = name
        updateContent()
    }

    private func removeList(withIndex index: Int) {
        database.shoppingListAray.remove(at: index)
        updateContent()
    }

    private func getListName(withIndex index: Int) -> String {
        return database.shoppingListAray[index].name
    }

    private func setupMainList() {
        mainListTableView.isHidden = database.shoppingListAray.isEmpty
        mainListTableView.tableFooterView = UIView()
        mainListTableView.rowHeight = 45
    }
    private func updateContent() {
        mainListTableView.isHidden = database.shoppingListAray.isEmpty
        mainListTableView.reloadData()
    }
}
