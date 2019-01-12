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
    
    let head: Node
    
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
    
    func addNode(withValue value:Int) {
        self.addNode(node: Node(value: value))
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
