//
//  Video.swift
//  VimeoStaffPicks
//
//  Created by Donny on 3/15/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import Foundation

class Video {
    
    var name: String? = ""
    var duration: Int? = 0
    var imageURLString: String? = ""
    
    init(dictionary: Dictionary<String, AnyObject>) {
        
        self.name = dictionary["name"] as? String
        self.duration = dictionary["duration"] as? Int
        
        let pictures = dictionary["pictures"] as? Dictionary<String, AnyObject>
        if let pictures = pictures {
            let sizes = pictures["sizes"] as? Array<Dictionary<String, AnyObject>>
            if let sizes = sizes {
                if sizes.count > 0 {
                    let picture = sizes[0]
                    self.imageURLString = picture["link"] as? String
                }
            }
        }
        
    }
    
}