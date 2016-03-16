//
//  ToDoListViewController.swift
//  ToDo
//
//  Created by Donny Davis on 3/16/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView?

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Set the title for the view
        self.title = "Todo List"
        
        // Create a navigation button to add a new item
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "didTapAdd:")
        
        // Create a navigation button to edit a table cell
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
    }
    
    // MARK: actions
    
    func didTapAdd(sender: UIBarButtonItem) {
        
        print("Add!")
        
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        
    }

}
