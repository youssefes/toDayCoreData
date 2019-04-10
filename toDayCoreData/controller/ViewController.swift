//
//  ViewController.swift
//  toDayCoreData
//
//  Created by youssef on 4/9/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class TOListTableView : UITableViewController {

    var listArray = [items]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = items()
        newItem.titel  = "youssef"
        listArray.append(newItem)
        let newItem3 = items()
        newItem3.titel  = "youssef"
        listArray.append(newItem3)
        let newItem2 = items()
        newItem2.titel  = "youssef"
        listArray.append(newItem2)
        let newItem4 = items()
        newItem4.titel  = "youssef"
        
       
        if let item = defaults.array(forKey: "ListOfData") as? [items]{
            self.listArray = item
        }
    }
    
    // MARK - TableNiew DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Today", for: indexPath)
        let item = listArray[indexPath.row]
        cell.textLabel?.text = item.titel
        
        cell.accessoryType = item.Done ? .checkmark : .none
        return cell
        
    }
    
    // MARK  - TableView Deleget
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        listArray[indexPath.row].Done = !listArray[indexPath.row].Done
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK - Add New Item
    
    @IBAction func AddItem(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default, handler: { (action) in
            let NewItem = items()
            NewItem.titel = textField.text!
            self.listArray.append(NewItem)
            
            self.defaults.set(self.listArray, forKey: "ListOfData")
            self.tableView.reloadData()
        })
        
        alert.addTextField { (TextField) in
            textField = TextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

