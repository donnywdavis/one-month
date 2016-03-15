//
//  VimeoClient.swift
//  VimeoStaffPicks
//
//  Created by Donny on 3/15/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import Foundation

typealias ServerResponseCallback = (videos: Array<Video>?, error: NSError?) -> Void

class VimeoClient {
    
    static let errorDomain = "VimeoClientErroDomain"
    static let baseURLString = "https://api.vimeo.com"
    static let staffPicksPath = "/channels/staffpicks/videos"
    static let authToken = "8b64f97e45f0bcaa5076e4638f7b47c9"
    
    class func staffPicks(callback: ServerResponseCallback) {
        
        let urlString = baseURLString + staffPicksPath
        let url = NSURL(string: urlString)
        
        if url == nil {
            let error = NSError(domain: errorDomain, code: 0, userInfo: [NSLocalizedDescriptionKey: "Unable to create URL"])
            callback(videos: nil, error: error)
            
            return
        }
        
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "GET"
        request.addValue("Bearer " + authToken, forHTTPHeaderField: "Authorization")
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                // Check if we get an error back
                if error != nil {
                    callback(videos: nil, error: error)
                    return
                }
                
                // Parse out the JSON data received into a dictionary
                var json: [String: AnyObject]?
                do {
                    json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableLeaves) as? Dictionary<String, AnyObject>
                } catch let error as NSError {
                    callback(videos: nil, error: error)
                    return
                }
                
                var videoArray = Array<Video>()
                if let json = json {
                    let dataArray = json["data"] as? Array<Dictionary<String, AnyObject>>
                    
                    if let dataArray = dataArray {
                        for value in dataArray {
                            let video = Video(dictionary: value)
                            videoArray.append(video)
                        }
                    }
                }

                callback(videos: videoArray, error: nil)
                
            })
            
        }
        
        task.resume()
        
    }
    
}