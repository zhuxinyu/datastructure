//
//  sorting.swift
//  dataStructure
//
//  Created by zhuxinyu on 2019/1/20.
//  Copyright © 2019 havefun. All rights reserved.
//

import Foundation

class sorting {
    
    func bubbling(data:[Int]) -> [Int] {
        var result:[Int] = data
        for _ in 0..<data.count {
            for i in 1..<data.count {
                if (result[i - 1] > result[i]) {
                    let temp:Int = result[i - 1]
                    result[i - 1] = result[i]
                    result[i] = temp
                    print(result)
                }
            }
        }
        return result
    }
}

