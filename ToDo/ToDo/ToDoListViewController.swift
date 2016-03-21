//
//  ToDoListViewController.swift
//  ToDo
//
//  Created by Donny Davis on 3/16/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController, UITableViewDataSource, AddItemViewControllerProtocol {
    
    @IBOutlet weak var tableView: UITableView?
    
    var items = NSMutableArray()
    let cellIdentifier = "CellIdentifier"
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Set the title for the view
        self.title = "Todo List"
        
        // Create a navigation button to add a new item
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "didTapAdd:")
        
        // Create a navigation button to edit a table cell
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        self.tableView?.dataSource = self
        self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
    }
    
    // MARK: Actions
    
    func didTapAdd(sender: UIBarButtonItem) {
        
        // Create a view controller to add items and add it to a navigation controller
        let viewController = AddItemViewController()
        viewController.delegate = self
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.view.backgroundColor = UIColor.whiteColor()
        
        self.presentViewController(navigationController, animated: true, completion: nil)
        
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        
        
        
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.items.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)!
        
        let item = self.items[indexPath.row] as! String
        
        cell.textLabel?.text = item
        
        return cell
        
    }
  
  
    // MARK: AddItemViewControllerProtocol
  
    func addItem(item: String) {
        // Add new item to the items array
        self.items.insertObject(item, atIndex: 0)
        
        // Insert the new item to the table view
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView?.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Right)
    }

}
