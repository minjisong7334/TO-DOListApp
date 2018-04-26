//
//  ViewController.swift
//  swift2
//
//  Created by minji song on 4/25/18.
//  Copyright © 2018 minji song. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    var items: [Checklistitem]
    
    required init?(coder aDecoder: NSCoder) {
        
        items = [Checklistitem]()
        
        let row0Item = Checklistitem()
        row0Item.text = "Walk the dog"
        row0Item.checked = false
        items.append(row0Item)
        
        let row1Item = Checklistitem()
        row1Item.text = "Brush my teeth"
        row1Item.checked = false
        items.append(row1Item)
        
        let row2Item = Checklistitem()
        row2Item.text = "Learn iOS development"
        row2Item.checked = false
        items.append(row2Item)
        
        let row3Item = Checklistitem()
        row3Item.text = "Soccer practice"
        row3Item.checked = false
        items.append(row3Item)
        
        let row4Item = Checklistitem()
        row4Item.text = "Eat ice cream"
        row4Item.checked = false
        items.append(row4Item)
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {

            items[indexPath.row].checked = !items[indexPath.row].checked
            
            configureCheckmark(for: cell, at: indexPath)
            
        }
            tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let label = cell.viewWithTag(1000) as! UILabel
        
        label.text = items[indexPath.row].text
        
        configureCheckmark(for: cell, at: indexPath)
        return cell
    }

    func configureCheckmark(for cell:UITableViewCell, at indexPath: IndexPath){
        var isChecked = false
        isChecked = items[indexPath.row].checked
        
        if isChecked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }

}

