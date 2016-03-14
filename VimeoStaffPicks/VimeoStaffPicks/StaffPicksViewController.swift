//
//  StaffPicksViewController.swift
//  VimeoStaffPicks
//
//  Created by Donny on 3/14/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import UIKit

class StaffPicksViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var tableView: UITableView?
    
    let items = ["donny", "shannon", "lee", "mattan", "syd", "zach"]
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Setup
    
    func setupTableView() {
        self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "placeholder")
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("placeholder")! as UITableViewCell
        
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }

}
