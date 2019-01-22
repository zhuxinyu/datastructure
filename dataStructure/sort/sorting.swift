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
    
    // 归并排序 = 分而治之 + 递归
    func mergeSort(_ array:[Int]) -> [Int] {
        guard array.count > 1 else { return array }
        
        let middleIndex = array.count / 2
        
        let leftArray = mergeSort(Array(array[0..<middleIndex]))
        
        let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
        
        return merge(leftPile: leftArray, rightPile: rightArray)
    }
    
    func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
        var leftIndex = 0
        var rightIndex = 0
        
        var orderPile = [Int]()
        
        while leftIndex < leftPile.count && rightIndex < rightPile.count {
            if leftPile[leftIndex] < rightPile[rightIndex] {
                orderPile.append(leftPile[leftIndex])
                leftIndex += 1
            } else if (leftPile[leftIndex] > rightPile[rightIndex]){
                orderPile.append(rightPile[rightIndex])
                rightIndex += 1
            } else {
                orderPile.append(leftPile[leftIndex])
                orderPile.append(rightPile[rightIndex])
                leftIndex += 1
                rightIndex += 1
            }
        }
        
        if leftIndex < leftPile.count {
            orderPile.append(leftPile[leftIndex])
            leftIndex += 1
        }
        
        if rightIndex < rightPile.count {
            orderPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
        
        return orderPile
    }
    
    func quicksortHoare<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
        if low < high {
            let p = partitionHoare(&a, low: low, high: high) // 寻找标记点
            quicksortHoare(&a, low: low, high: p)
            quicksortHoare(&a, low: p + 1, high: high)
        }
    }
    
    func partitionHoare<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
        let privot = a[low]
        var i = low - 1 // do while避免越界
        var j = high + 1 // 同上
        
        while true {
            repeat { j -= 1 } while a[j] > privot
            repeat { i += 1 } while a[i] < privot
            
            if i < j {
                a.swapAt(i, j)
            } else {
                return j
            }
        }
        
    }
    
}

