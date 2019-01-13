//
//  bothwayLinkedList.swift
//  dataStructure
//
//  Created by zhuxinyu on 2019/1/13.
//  Copyright © 2019 havefun. All rights reserved.
//

// 双向链表 

import Foundation

class bothWayNode {
    var pre: bothWayNode?
    var value: Int
    var next: bothWayNode?
    
    init(pre: bothWayNode? = nil, value: Int, next: bothWayNode? = nil) {
        self.pre = pre
        self.value = value
        self.next = next
    }
}

class bothWayList {
    var head: bothWayNode
    
    init(node: bothWayNode) {
        self.head = node
    }
    
    convenience init(nodeValue value:Int) {
        self.init(node: bothWayNode(value: value))
    }
    
    func addNode(node: bothWayNode) {
        var current: bothWayNode = self.head
        while current.next != nil {
            current = current.next!
        }
        current.next = node
        node.pre = current
    }
    
    func removeNode(node: bothWayNode) {
        var current: bothWayNode = self.head
        while current.next != nil {
            if (current.next?.value == node.value && current.next?.next != nil) {
                current.next = current.next?.next!
                current.next?.pre = current
                break
            }
            current = current.next!
        }
    }
    
    func addNode(nodeValue value:Int) {
        self.addNode(node: bothWayNode(value: value))
    }
    
    func removeNode(nodeValue value: Int) {
        self.removeNode(node: bothWayNode(value: value))
    }
    
    func length() -> Int {
        var length: Int = 0
        var current: bothWayNode = self.head
        while current.next != nil {
            current = current.next!
            length += 1
        }
        return length
    }
    
    func reverse() {
        var current: bothWayNode? = self.head
        while current != nil {
            let temp:bothWayNode? = current?.pre
            current?.pre = current?.next
            current?.next = temp
            if (current?.pre == nil) {
                self.head = current!
                break
            }
            current = current?.pre
        }
    }
    
    func traverse() -> [Int: Any] {
        var results: [Int: Any] = [:]
        var current: bothWayNode = self.head
        while current.next != nil {
            let preValue = current.pre != nil ? "\(current.pre!.value)" : "nil"
            let nextValue = current.next != nil ? "\(current.next!.value)" : "nil"
            results[current.value] = ["pre": preValue , "next": nextValue]
            current = current.next!
        }
        return results
    }
    
}
