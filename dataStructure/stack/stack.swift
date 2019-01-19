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

