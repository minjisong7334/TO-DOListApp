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
        
        row1Item = Checklistitem()
        row1Item.text = "Brush my teeth"
        row1Item.checked = false
        
        row2Item = Checklistitem()
        row2Item.text = "Learn iOS development"
        row2Item.checked = false
        
        row3Item = Checklistitem()
        row3Item.text = "Soccer practice"
        row3Item.checked = false
        
        row4Item = Checklistitem()
        row4Item.text = "Eat ice cream"
        row4Item.checked = false
        
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

            if indexPath.row == 0 {
                row0Item.checked = !row0Item.checked
            }
            if indexPath.row == 1 {
                row1Item.checked = !row1Item.checked
            }
            if indexPath.row == 2 {
                row2Item.checked = !row2Item.checked
            }
            if indexPath.row == 3 {
                row3Item.checked = !row3Item.checked
            }
            if indexPath.row == 4 {
                row4Item.checked = !row4Item.checked
            }
            
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
        
        if(indexPath.row == 0) {
            label.text = row0Item.text
        }else if (indexPath.row == 1) {
            label.text = row1Item.text
        }else if (indexPath.row == 2) {
            label.text = row2Item.text
        }else if (indexPath.row == 3) {
            label.text = row3Item.text
        }else if (indexPath.row == 4) {
            label.text = row4Item.text
        }
        
        configureCheckmark(for: cell, at: indexPath)
        return cell
    }

    func configureCheckmark(for cell:UITableViewCell, at indexPath: IndexPath){
        var isChecked = false
        if indexPath.row == 0 {
            isChecked = row0Item.checked
        } else if indexPath.row == 1 {
            isChecked = row1Item.checked
        } else if indexPath.row == 2 {
            isChecked = row2Item.checked
        } else if indexPath.row == 3 {
            isChecked = row3Item.checked
        } else if indexPath.row == 4 {
            isChecked = row4Item.checked
        }
        
        if isChecked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }

}

