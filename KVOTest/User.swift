//
//  User.swift
//  KVOTest
//
//  Created by Fernando Gomes on 31/07/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import Foundation

class User: NSObject {
    @objc dynamic var name = String()
    
    @objc var age = 0
//        {
//        willSet { willChangeValue(forKey: #keyPath(age)) }
//        didSet { didChangeValue(for: \User.age) }
//    }
    
    
    
}
