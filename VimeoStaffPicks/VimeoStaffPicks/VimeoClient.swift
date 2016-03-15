//
//  VimeoClient.swift
//  VimeoStaffPicks
//
//  Created by Donny on 3/15/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import Foundation

typealias ServerResponseCallback = (object: Dictionary<String, AnyObject>?, error: NSError?) -> Void

class VimeClient {
    
    static let errorDomain = "VimeoClientErroDomain"
    static let baseURLString = "https://api.vimeo.com"
    static let staffPicksPath = "/channels/staffpicks/videos"
    static let authToken = "8b64f97e45f0bcaa5076e4638f7b47c9"
    
    class func staffPicks(callback: ServerResponseCallback) {
        
        let urlString = baseURLString + staffPicksPath
        let url = NSURL(string: urlString)
        
        if url == nil {
            let error = NSError(domain: errorDomain, code: 0, userInfo: [NSLocalizedDescriptionKey: "Unable to create URL"])
            callback(object: nil, error: error)
            
            return
        }
        
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "GET"
        request.addValue("Bearer " + authToken, forHTTPHeaderField: "Authorization")
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(response)
            print(responseString)
            
            callback(object: nil, error: nil)
        }
        
        task.resume()
        
    }
    
}