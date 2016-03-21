//
//  KeyedArchiverCache.swift
//  ToDo
//
//  Created by Donny Davis on 3/21/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import Foundation

class KeyedArchiverCache: CacheProtocol {
    
    
    func loadObjectForKey(key: String) -> AnyObject? {
        
        let path = self.archivePath(key)
        
        return NSKeyedUnarchiver.unarchiveObjectWithFile(path)
        
    }
    
    func saveObject(object: AnyObject, key: String) {
        
        let path = self.archivePath(key)
        
        NSKeyedArchiver.archiveRootObject(object, toFile: path)
        
    }
    
    
    // MARK: Utilities
    
    private func archivePath(key: String) -> String {
        
        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        var url = NSURL(string: path)!
        
        url = url.URLByAppendingPathComponent(key)
        url = url.URLByAppendingPathExtension("archive")
        
        return url.absoluteString as String
        
    }
    
}