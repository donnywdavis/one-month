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
        self.title = "Staff Picks"
        self.setupTableView()
        
        self.refreshItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Setup
    
    func setupTableView() {
        let nib = UINib(nibName: "VideoCell", bundle: nil)
        self.tableView?.registerNib(nib, forCellReuseIdentifier: NSStringFromClass(VideoCell.self))
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(VideoCell.self))! as! VideoCell
        
        cell.nameLabel?.text = self.items[indexPath.row]
        
        return cell
    }
    
    func refreshItems() {
        VimeoClient.staffPicks { (videos, error) -> Void in
            
            if let videos = videos {
                for video in videos {
                    print(video.name)
                }
            }
            
        }
        
    }

}
