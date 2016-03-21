//
//  UserDefaultsCache.swift
//  ToDo
//
//  Created by Donny Davis on 3/21/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import Foundation

class UserDefaultsCache: CacheProtocol {
    
    func loadObjectForKey(key: String) -> AnyObject? {
        
        return NSUserDefaults.standardUserDefaults().objectForKey(key)
        
    }
    
    func saveObject(object: AnyObject, key: String) {
        
        NSUserDefaults.standardUserDefaults().setObject(object, forKey: key)
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    
}