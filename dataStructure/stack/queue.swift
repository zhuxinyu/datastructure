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
