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
    
    func insert(data:[Int])-> [Int] {
        var result:[Int] = []
        for j in 0..<data.count {
            if (result.count == 0) {
                result.append(data[j])
                continue
            }
            if (result.count == 1) {
                if (data[j] > result[0]) {
                    result.append(data[j])
                } else {
                    result.append(result[0])
                    result[0] = data[j]
                }
                continue
            }
            
            let temp: Int = data[j]
            for i in 1..<result.count {
                if (temp > result[i - 1] && temp < result[i]) {
                    result.insert(temp, at: i)
                } else if (temp < result[0]) {
                    result.insert(temp, at: i-1)
                } else if (temp > result.last!){
                    result.append(temp)
                }
                print(result)
            }
        }
        return result
    }
}

