//
//  stack.swift
//  dataStructure
//
//  Created by zhuxinyu on 2019/1/18.
//  Copyright © 2019 havefun. All rights reserved.
//

import Foundation

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

