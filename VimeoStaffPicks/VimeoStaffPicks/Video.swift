//
//  Video.swift
//  VimeoStaffPicks
//
//  Created by Donny on 3/15/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import Foundation
import UIKit

class Video {
    
    var name: String? = ""
    var duration: String?
    var imageURLString: String? = ""
    
    init(dictionary: Dictionary<String, AnyObject>) {
        
        self.name = dictionary["name"] as? String
        let duration = dictionary["duration"] as? Int ?? 0
        self.duration = self.formattedDuration(duration)
        
        let pictures = dictionary["pictures"] as? Dictionary<String, AnyObject>
        if let pictures = pictures {
            let sizes = pictures["sizes"] as? Array<Dictionary<String, AnyObject>>
            if let sizes = sizes {
                if sizes.count > 0 {
                    let screenWidth = UIScreen.mainScreen().bounds.size.width * UIScreen.mainScreen().scale
                    let viableSizes = sizes.filter({$0["width"] as? CGFloat >= screenWidth})
                    if viableSizes.count > 0 {
                        let selectedSize = viableSizes[0]
                        self.imageURLString = selectedSize["link"] as? String
                    }
                }
            }
        }
        
    }
    
    func formattedDuration(duration: Int) -> String {
        let minutes = duration / 60
        let seconds = duration % 60
        let minutesString = minutes < 10 ? "0\(minutes)" : "\(minutes)"
        let secondsString = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        return minutesString + ":" + secondsString
    }
    
}