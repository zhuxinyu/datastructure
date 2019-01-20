//
//  stack.swift
//  dataStructure
//
//  Created by zhuxinyu on 2019/1/18.
//  Copyright © 2019 havefun. All rights reserved.
//

import Foundation

/*
 操作系统给每个线程分配了一块独立的内存空间-栈，存储函数调用时的临时变量。每进入一个函数就会将临时变量作为一个栈帧入栈，当被调用函数执行完毕，返回之后将这个函数对应的栈帧出栈。
 */

protocol Stack {
    associatedtype Element
    
    var isEmpty: Bool { get }
    var size: Int { get }
    var peek: Element? { get }
    
    mutating func push(_ newElement: Element)
    mutating func pop() -> Element?
}

struct IntegerStack: Stack {
    typealias Element = Int
    
    var isEmpty: Bool{ return stack.isEmpty }
    var size: Int { return stack.count }
    var peek: Int?{ return stack.last }
    
    private var stack = [Element]()
    
    mutating func push(_ newElement: Int) {
        stack.append(newElement)
    }
    
    mutating func pop() -> Int? {
       return stack.popLast()
    }
    
}

class linkedStack {
    var top: Node?
    var size: Int = 0

    func push(value: Int) {
        size += 1
        let node = Node(value: value)
        if (self.top == nil) {
            self.top = node
            return
        }
        node.next = self.top
        self.top = node
    }
    
    func pop() -> Node? {
        if (self.top == nil) {
            return nil
        }
        size -= 1
        let temp = self.top
        self.top = self.top?.next
        return temp
    }
    
    func traverse() -> [Int] {
        var results: [Int] = []
        var current: Node? = self.top
        while current != nil {
            results.append(current!.value)
            current = current?.next
        }
        return results
    }
}

class evalStack {
    var result:Int = 0
    var numStack: linkedStack?
    var operatorStack: linkedStack?
    
    init() {
        numStack = linkedStack()
        operatorStack = linkedStack()
    }
    
    func pushNum(value:Int) {
        if (isMatch()) { // 数字跟操作符数量不匹配
            return
        }
        if (operatorStack?.size ?? 0 > 0) {
            let tempOp:Node = operatorStack!.pop()!
            if (tempOp.value == 2 || tempOp.value == 3) {
                if let tempNum:Node = numStack?.pop() {
                    var result:Int = 0
                    if (tempOp.value == 2) { result = tempNum.value * value }
                    if (tempOp.value == 3) { result = tempNum.value / value }
                    numStack?.push(value: result)
                    return
                }
            } else {
                operatorStack?.push(value: tempOp.value)
                numStack?.push(value: value)
            }
            return
        }
        numStack?.push(value: value)
    }
    
    // 0:+ 1:- 2:x 3:/
    func pushOperator(op: Int) {
        if (isMatch()) { // 数字跟操作符数量不匹配
            return
        }
        operatorStack?.push(value: op)
    }
    
    func eval() -> Int{
        if (operatorStack?.size == 0 ) {
            return numStack?.pop()?.value ?? 0
        }
        if (operatorStack?.size == numStack?.size) {
            operatorStack?.pop()
        }
        for _ in 0..<operatorStack!.size {
            if let tempop: Node = operatorStack?.pop(), let tempNum_1:Node = numStack?.pop(), let tempNum_2:Node = numStack?.pop() {
                var result:Int = 0
                if (tempop.value == 0) { result = tempNum_1.value + tempNum_2.value }
                if (tempop.value == 1) { result = tempNum_2.value - tempNum_1.value }
                numStack?.push(value: result)
            }
        }
        return numStack?.pop()?.value ?? 0
    }
    
    func isMatch() -> Bool {
        return numStack?.size ?? 0 > (operatorStack?.size ?? 0) + 1 // 数字跟操作符数量不匹配
    }
}

