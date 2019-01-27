//
//  singleton.swift
//  dataStructure
//
//  Created by zhuxinyu on 2019/1/27.
//  Copyright © 2019 havefun. All rights reserved.
//

import Foundation

class singleton {
    
    static let shared = singleton()
    
    private init(){}
    
    func doSth() {
        print("🐒🐒🐒")
    }
}
