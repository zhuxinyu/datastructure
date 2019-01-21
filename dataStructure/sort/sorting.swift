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
        var times:Int = 0
        var result:[Int] = data
        for _ in 0..<data.count {
            for i in 1..<data.count {
                if (result[i - 1] > result[i]) {
                    let temp:Int = result[i - 1]
                    result[i - 1] = result[i]
                    result[i] = temp
                    times += 1
                }
            }
        }
        print(times)
        return result
    }
    
    // 插入排序生成新表
    func insert(_ data:[Int])-> [Int] {
        var result:[Int] = []
        var times:Int = 0
        for j in 0..<data.count {
            if (result.count == 0) {
                result.append(data[j])
                times += 1
                continue
            }
            if (result.count == 1) {
                times += 1
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
                    times += 1
                    result.insert(temp, at: i)
                } else if (temp < result[0]) {
                    times += 1
                    result.insert(temp, at: i-1)
                } else if (temp > result.last!){
                    times += 1
                    result.append(temp)
                }
            }
        }
        print(times)
        return result
    }
    
    func select(data:[Int]) -> [Int]{
        var times:Int = 0
        var result:[Int] = data
        var location:Int = 0
        for i in 0..<result.count {
            var min:Int = result[i]
            location = i
            for j in i..<result.count {
                if (min > result[j]) {
                    min = result[j]
                    location = j
                    times += 1
                }
            }
            let temp:Int = result[i]
            result[i] = min
            result[location] = temp
        }
        print(times)
        return result
    }

    func shell(_ data: inout [Int]){
        var times:Int = 0
        var gap = data.count / 2
        while gap > 0 {
            for pos in 0..<gap {
                insertionSort(&data, start: pos, gap: gap, times: &times)
            }
            gap = gap / 2
        }
        print(times)
    }
    
    // 插入排序 - 原表排序 （希尔排序是在插入排序的基础上进行了分组排序优化，原表排序不会增加时间和空间复杂度）
    func insertionSort(_ array: inout [Int], start:Int, gap:Int, times: inout Int){
        for var x in 0..<(array.count / gap + 1) {
            var y = start + max(0, (x - 1) * gap)
            x = gap * x + start
            if (x >= array.count) { return }
            while y >= 0 && array[y] > array[y + gap] {
                array.swapAt(y, y + gap)
                y -= gap
                times += 1
            }
        }
    }
    
}
