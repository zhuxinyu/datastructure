//
//  chain.swift
//  dataStructure
//
//  Created by zhuxinyu on 2018/12/29.
//  Copyright © 2018 havefun. All rights reserved.
//

// 单链表 / 循环链表 (特殊的单链表： tail.next => head)

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
    
    func removeHead() {
        if self.head.next != nil {
            self.head = self.head.next!
        }
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
    
    func reverse(node: Node? = nil) { // 若传入node 则node后进行反转
        var head: Node? = node?.next ?? self.head.next
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
        if (node != nil) {
            node?.next = reverseHead
        } else {
            self.head = Node(value: 4, next: reverseHead)
        }
    }
    
    func traverse() -> [Int] {
        var results: [Int] = []
        var current: Node = self.head
        while current.next != nil {
            results.append(current.value)
            current = current.next!
        }
        results.append(current.value)
        return results
    }
    
    func isPlalindrome() -> Bool {
        var fast: Node = self.head // 声明快慢指针
        var slow: Node = self.head
        if (self.head.next == nil) {
            return true
        }
        if (self.head.next?.next == nil) {
            return self.head.value == self.head.next?.value
        }
        while fast.next?.next != nil { // 快指针一定先到达终点 停止前进
            fast = fast.next!.next!
            slow = slow.next!
        }
        
        let mid:Node = slow
        reverse(node: mid) // 后半段链表反转

        slow = slow.next! // slow指向后半段链表头部
        
        fast = self.head // slow是中间 fast重置为头部 两个指针同时进行比较
        while slow.next != nil { // 慢指针从后半段开始 一定先到达或跟快指针同时到达终点
            if (fast.value != slow.value) { return false }
            fast = fast.next!
            slow = slow.next!
        }
        return true
    }
    
}
