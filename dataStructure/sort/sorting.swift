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
                }
            }
        }
        return result
    }
    
    // 插入排序生成新表
    func insert(_ data:[Int])-> [Int] {
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
            }
        }
        return result
    }
    
    func select(data:[Int]) -> [Int]{
        var result:[Int] = data
        var location:Int = 0
        for i in 0..<result.count {
            var min:Int = result[i]
            location = i
            for j in i..<result.count {
                if (min > result[j]) {
                    min = result[j]
                    location = j
                }
            }
            let temp:Int = result[i]
            result[i] = min
            result[location] = temp
        }
        return result
    }

    func shell(_ data: inout [Int]){
        var gap = data.count / 2
        while gap > 0 {
            for pos in 0..<gap {
                insertionSort(&data, start: pos, gap: gap)
            }
            gap = gap / 2
        }
    }
    
    // 插入排序 - 原表排序 （希尔排序是在插入排序的基础上进行了分组排序优化，原表排序不会增加时间和空间复杂度）
    func insertionSort(_ array: inout [Int], start:Int, gap:Int){
        for var x in 0..<(array.count / gap + 1) {
            var y = start + max(0, (x - 1) * gap)
            x = gap * x + start
            if (x >= array.count) { return }
            while y >= 0 && array[y] > array[y + gap] {
                array.swapAt(y, y + gap)
                y -= gap
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
            repeat { j -= 1 } while a[j] > privot // 左 <- 右  if [右] > 标记值 就一直移动指针 否则停止 返回当前位置 准备交换
            repeat { i += 1 } while a[i] < privot // 左 -> 右  if [左] < 标记值 就一直移动指针 否则停止 返回当前位置 准备交换
            
            if i < j { // 当左右指针还未相遇 交换值
                a.swapAt(i, j)
            } else {
                return j // 当左右指针相遇 返回当前右指针位置
            }
        }
        
    }
    
    func countSort(array: [Int]) -> [Int] {
        let maxElement = array.max() ?? 0
        
        var countArray = [Int](repeating: 0, count: Int(maxElement + 1))
        for element in array {
            countArray[element] += 1
        }
        
        // 每个位置都是前面所有节点的计数和 也就是当前节点应该存在的截止位置
        for index in 1..<countArray.count {
            let sum = countArray[index] + countArray[index - 1]
            countArray[index] = sum
        }
        
        var sortedArray = [Int](repeating: 0, count: array.count)
        for element in array {
            countArray[element] -= 1 // 每次插入一个值 就会向前移动一个位置
            sortedArray[countArray[element]] = element
        }
        return sortedArray
    }
}

struct Heap<Element: Equatable> {
    
    var elements:[Element] = []
    let sort: (Element, Element) -> Bool
    
    init(sort: @escaping (Element, Element) -> Bool, elements:[Element] = []) {
        self.sort = sort
        self.elements = elements
        
        if !elements.isEmpty {
            for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
                siftDown(from: i,upTo: elements.count)
            }
        }
    }
    
    var isEmpty:Bool {
        return elements.isEmpty
    }
    
    var count:Int {
        return elements.count
    }
    
    var peek:Element? {
        return elements.first
    }
    
    func leftChildIndex(ofParentAt Index:Int) -> Int {
        return (2 * Index) + 1
    }
    
    func rightChildIndex(ofParentAt Index:Int) -> Int {
        return (2 * Index) + 2
    }
    
    func parentIndex(ofChildAt Index:Int) -> Int {
        return (Index - 1) / 2
    }
    
    mutating func remove() -> Element? {
        guard !isEmpty else {
            return nil
        }
        elements.swapAt(0, count - 1)
        defer{
            siftDown(from: 0,upTo: elements.count - 1)
        }
        return elements.removeLast()
    }
    
    // 将剩余节点中 最大/小的放到根节点 数组[0]位置
    mutating func siftDown(from Index:Int, upTo size:Int) {
        var parent = Index
        while true {
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            var condidate = parent
            if left < size && sort(elements[left], elements[condidate]) {
                condidate = left
            }
            if right < size && sort(elements[right], elements[condidate]) {
                condidate = right
            }
            if condidate == parent {
                return
            }
            elements.swapAt(parent, condidate)
            parent = condidate
        }
    }
    
    mutating func insert(_ element:Element) {
        elements.append(element)
        siftUp(from: elements.count - 1)
    }
    
    mutating func siftUp(from index:Int) {
        var child = index
        var parent = parentIndex(ofChildAt: child)
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            print("inser \(elements)")
            child = parent
            parent = parentIndex(ofChildAt: child)
        }
    }
    
    mutating func remove(at index:Int) -> Element? {
        guard index < elements.count else {
            return nil
        }
        if index == elements.count - 1 {
            return elements.removeLast()
        } else {
            elements.swapAt(index, elements.count - 1)
            defer{
                siftDown(from: index, upTo: elements.count)
                siftUp(from: index)
            }
            return elements.removeLast()
        }
    }
    
    func index(of element: Element, startingAt i:Int) -> Int? {
        if i >= count {
            return nil
        }
        if sort(element, elements[i]) {
            return nil
        }
        if element == elements[i] {
            return nil
        }
        if let j = index(of: element, startingAt: leftChildIndex(ofParentAt: i)) {
            return j
        }
        if let j = index(of: element, startingAt: rightChildIndex(ofParentAt: i)) {
            return j
        }
        return nil
    }
}

extension Heap {
    
    func sorted() -> [Element] {
        var heap = Heap(sort: sort, elements: elements)
        for index in heap.elements.indices.reversed(){
            heap.elements.swapAt(0, index) // 交换最大/小的值到正确排序位置
            print("extension \(heap.elements)")
            heap.siftDown(from: 0, upTo: index)
        }
        return heap.elements
    }
    
}

extension Array where Element == Int {
    
    public mutating func radixSort() {
        let base = 10
        var done = false
        var digits = 1
        
        while !done {
            done = true
            var buckets:[[Int]] = .init(repeating: [], count: base)
            forEach { number in
                let remainingPart = number / digits
                let digit = remainingPart % base
                buckets[digit].append(number)
                if remainingPart > 0 {
                    done = false
                }
            }
            digits *= base
            self = buckets.flatMap{ $0 }
        }
    }
}

