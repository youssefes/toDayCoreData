//
//  ViewController.swift
//  toDayCoreData
//
//  Created by youssef on 4/9/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

class TOListTableView : UITableViewController {

    var listArray = ["ahmed","ali","mohammed"]
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = defaults.array(forKey: "ListOfData") as? [String]{
            self.listArray = item
        }
    }
    
    // MARK - TableNiew DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Today", for: indexPath)
        
        cell.textLabel?.text = listArray[indexPath.row]
        
        return cell
        
    }
    
    // MARK  - TableView Deleget
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(listArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK - Add New Item
    
    @IBAction func AddItem(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default, handler: { (action) in
            self.listArray.append(textField.text!)
            
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

