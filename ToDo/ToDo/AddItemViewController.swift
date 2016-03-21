//
//  AddItemViewController.swift
//  ToDo
//
//  Created by Donny Davis on 3/16/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import UIKit

protocol AddItemViewControllerProtocol {
  
    func addItem(item: String)
  
}

class AddItemViewController: UIViewController, UITextFieldDelegate {
  
    @IBOutlet weak var textField: UITextField?
  
    var delegate: AddItemViewControllerProtocol?

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Set the title for the add item view
        self.title = "Add Item"
      
        // Force view to display starting at the bottom edge of the navigation controller
        self.edgesForExtendedLayout = UIRectEdge.None
      
        // Add a cancel button to the navigation controller
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: "didTapCancel:")
      
        // Set focus on the text field and display the keyboard
        self.textField?.becomeFirstResponder()
        self.textField?.delegate = self

    }
    
    // MARK: Actions
    
    func didTapCancel(sender: UIBarButtonItem) {
        
        // Dismiss the view
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
  
    // MARK: UITextFieldDelegate
  
    func textFieldShouldReturn(textField: UITextField) -> Bool {
    
        // Dismiss the view when done is pressed.
        self.dismissViewControllerAnimated(true) { () -> Void in
            if let delegate = self.delegate, let item = textField.text where textField.text?.characters.count > 0 {
                delegate.addItem(item)
            }
        }
    
        return true
    }

}
