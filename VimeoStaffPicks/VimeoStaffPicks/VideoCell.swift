//
//  VideoCell.swift
//  VimeoStaffPicks
//
//  Created by Donny on 3/14/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import UIKit

class VideoCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var durationLabel: UILabel?
    @IBOutlet weak var videoImageView: UIImageView?
    
    var task: NSURLSessionDataTask?
    
    var video: Video? {
        didSet {
            if let video = video {
                self.nameLabel?.text = video.name
                
                if let duration = video.duration {
                    self.durationLabel?.text = duration
                } else {
                    self.durationLabel?.text = "00:00"
                }
                
                if let imageURLString = video.imageURLString {
                    let url = NSURL(string: imageURLString)!
                    self.task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { [weak self] (data, response, error) -> Void in
                        
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            if let strongSelf = self {
                                if imageURLString != strongSelf.video?.imageURLString {
                                    return
                                }
                                
                                strongSelf.task = nil
                                
                                if let data = data {
                                    let image = UIImage(data: data)
                                    strongSelf.videoImageView?.image = image
                                    
                                } else {
                                    // TODO: alert the user
                                }
                            }
                        })
                    
                    })
                    
                    self.task?.resume()
                }
            }
        }
    }
    
    deinit {
        self.task?.cancel()
        self.task = nil
    }
    
    override func prepareForReuse() {
        self.video = nil
        self.nameLabel?.text = ""
        self.durationLabel?.text = ""
        self.videoImageView?.image = nil
        self.task?.cancel()
        self.task = nil
    }
    
}
