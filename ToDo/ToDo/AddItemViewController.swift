//
//  AddItemViewController.swift
//  ToDo
//
//  Created by Donny Davis on 3/16/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Set the title for the add item view
        self.title = "Add Item"
        
        // Add a cancel button to the navigation controller
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: "didTapCancel:")

    }
    
    // MARK: Actions
    
    func didTapCancel(sender: UIBarButtonItem) {
        
        // Dismiss the view
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }

}
