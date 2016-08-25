//
//  Serializable.swift
//  Serializable
//
//  Created by Marcos García on 25/08/16.
//  Copyright © 2016 Marcos García. All rights reserved.
//

import Foundation

protocol Serializable {}

extension Serializable {
    private func unwrap(any:Any) -> Any {
        let mirror = Mirror(reflecting: any)
        if mirror.displayStyle != .Optional {
            return any
        }
        if mirror.children.count == 0 { return NSNull() }
        let (_, some) = mirror.children.first!
        return some
    }
    
    func toDict() -> [String:AnyObject]? {
        var dict = [String:AnyObject]()
        let mirror = Mirror(reflecting: self)
        for child in mirror.children {
            if let key = child.label {
                let val = unwrap(child.value)
                if val as? NSObject != NSNull() {
                    dict[key] = val as? AnyObject
                }
            }
        }
        return dict
    }
}
