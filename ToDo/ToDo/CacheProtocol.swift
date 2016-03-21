//
//  CacheProtocol.swift
//  ToDo
//
//  Created by Donny Davis on 3/21/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

import Foundation

protocol CacheProtocol {
    
    func loadObjectForKey(key: String) -> AnyObject?
    
    func saveObject(object: AnyObject, key: String)
    
}