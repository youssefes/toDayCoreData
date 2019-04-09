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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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


}

