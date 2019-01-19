//
//  circulationQueue.swift
//  dataStructure
//
//  Created by zhuxinyu on 2019/1/19.
//  Copyright © 2019 havefun. All rights reserved.
//

import Foundation

class queueCycle {
    var head: Node?
    var tail: Node?
    var size: Int = 0 // 队列容量
    var length: Int = 0 // 目前长度
    
    init(size: Int) {
         // 初始化循环队列的长度 不小于0
        self.size = max(0, size)
    }
    
    func enqueue(value: Int) {
        let node: Node = Node(value: value)
        if (length == size) { // 队满不进入 阻塞
            return
        }
        length += 1
        if (self.tail == nil) {
            self.tail = node
            self.head = self.tail
            return
        }
        self.tail?.next = node
        self.tail = node
    }
    
    func dequeue() -> Node? {
        if (length == 0) { // 队空
            return nil
        }
        let temp: Node = self.head!
        length -= 1
        if (length == 1) {
            self.tail = nil
            self.head = nil
            return temp
        }
        self.head = self.head?.next
        return temp
    }
    
    
    func traverse() -> [Int] {
        var results: [Int] = []
        var current: Node? = self.head
        while current != nil {
            results.append(current!.value)
            current = current?.next
        }
        return results
    }
    
}
