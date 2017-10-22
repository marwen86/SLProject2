//
//  StorageManager.swift
//  SLProject
//
//  Created by Mohamed Marouane YOUSSEF on 22/10/2017.
//  Copyright © 2017 Mohamed Marouane YOUSSEF. All rights reserved.
//

import Foundation
struct StorageManager {
    static func setObject(value:Any ,key:String){
        let pref = UserDefaults.standard
        pref.set(value, forKey: key)
        pref.synchronize()
    }
    
    static func getObject(key:String) -> Any?{
        let pref = UserDefaults.standard
        let value = pref.value(forKey: key)
        return value
    }
}
