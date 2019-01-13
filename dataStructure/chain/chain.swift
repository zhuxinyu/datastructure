//
//  chain.swift
//  dataStructure
//
//  Created by zhuxinyu on 2018/12/29.
//  Copyright © 2018 havefun. All rights reserved.
//

import Foundation

class Node {
    var value: Int
    var next: Node?
    
    init(value: Int, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

class LinkedList {
    
    var head: Node
    
    init(node: Node) {
        self.head = node
    }
    
    convenience init(nodeValue: Int) {
        self.init(node: Node(value: nodeValue))
    }
    
    func addNode(node: Node) {
        var current: Node = self.head
        while current.next != nil {
            current = current.next!
        }
        current.next = node
    }
    
    func removeNode(node: Node) {
        var current: Node = self.head
        while current.next != nil {
            if current.next?.value == node.value {
                current.next = current.next?.next
            } else {
                current = current.next!
            }
        }
    }
    
    func addNode(withValue value:Int) {
        self.addNode(node: Node(value: value))
    }
    
    func removeNode(withValue value: Int) {
        self.removeNode(node: Node(value: value))
    }
    
    func length() -> Int {
        var length: Int  = 0
        var current: Node = self.head
        while current.next != nil {
            current = current.next!
            length += 1
        }
        return length
    }
    
    func reverse() {
        var head: Node? = self.head.next
        var reverseHead: Node?
        var pre: Node?
        while head != nil {
            let current = head?.next
            if current == nil {
                reverseHead = head
            }
            head?.next = pre
            pre = head
            head = current
        }
        self.head = Node(value: 4, next: reverseHead)
    }
    
    func traverse() -> [Int] {
        var results: [Int] = []
        var current: Node = self.head
        while current.next != nil {
            current = current.next!
            results.append(current.value)
        }
        return results
    }
    
}
