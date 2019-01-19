//
//  queue.swift
//  dataStructure
//
//  Created by zhuxinyu on 2019/1/18.
//  Copyright © 2019 havefun. All rights reserved.
//

import Foundation

protocol Queue {
    associatedtype Element
    
    var isEmpty:Bool { get }
    var size:Int { get }
    var peek:Element? { get }
    
    mutating func enqueue(_ newElement: Element)
    mutating func dequeue() -> Element?
}

struct IntegerQueue: Queue {
    typealias Element = Int
    
    private var left = [Element]()
    private var right = [Element]()
    
    var isEmpty: Bool { return left.isEmpty && right.isEmpty }
    var size: Int { return left.count + right.count }
    var peek: Int? { return left.isEmpty ?  right.first : left.last }
    
    mutating func enqueue(_ newElement: Int) {
        right.append(newElement)
    }
    
    mutating func dequeue() -> Int? {
        if (left.isEmpty) {
            left = right.reversed()
            right.removeAll()
        }
        return left.popLast()
    }
}

class linkedQueue {
    var head:Node?
    var tail:Node?
    
    func enqueue(value: Int) {
        let node:Node = Node(value: value)
        if (self.head == nil) {
            self.head = node
            self.tail = self.head
            return
        }
        self.tail?.next = node
        self.tail = node
    }
    
    func dequeue() -> Node? {
        if (self.head == nil) {
            return nil
        }
        let temp: Node = self.head!
        if (self.head?.next == nil) {
            self.head = nil
            self.tail = nil
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
