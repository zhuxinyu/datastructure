//
//  hashList.swift
//  dataStructure
//
//  Created by zhuxinyu on 2019/1/17.
//  Copyright © 2019 havefun. All rights reserved.
//

import Foundation

enum errormsg: Error {
    case outOfBounds, objNotFound
}

class hashNode {
    var pre: hashNode?
    var next: hashNode?
    var obj: Any
    
    init(pre: hashNode? = nil, next: hashNode? = nil, obj: Any) {
        self.pre = pre
        self.next = next
        self.obj = obj
    }
}

// 双向链表 模拟实现数组
// 散列表 模拟实现字典
// 使用散列表的原因： 1. 使用hashcode比遍历或二分查找效率高 2.hashcode过大的时候进行取余分组（数组），为避免余数重复，每组用链表实现数组，先按hashcode取分组，再进行链表遍历取值
class hashList {
    var _size: Int = 0
    var _first: hashNode?
    var _last: hashNode?
    
    init(obj: Any) {
        _size = 1
        _first = hashNode(obj: obj)
        _last = _first
    }
    
    convenience init(withObj obj: Any) {
        self.init(obj: obj)
    }
    
    func addNode(node: hashNode) {
        _size += 1
        
        // 空数组时初始化
        if (_first == nil) {
            _first = hashNode(obj: node.obj)
            _last = _first
            return
        }
        
        // 非空数组时增加节点
        node.pre = _last
        node.next = nil
        _last?.next = node
        _last = node
        
    }
    
    func addNode(withObj obj: Any) {
        self.addNode(node: hashNode(obj: obj))
    }
    
    // 根据索引删除元素
    func removeAtIndex(index: Int) {
        if (index < 0 || index >= _size) { return }
        
        _size -= 1
        if (_size < 0) {
            _size = max(0, _size)
            return
        }
        
        var temp: hashNode = _first!
        for i in 0..<_size {
            if (i == index) {
                temp.pre?.next = temp.next
                temp.next?.pre = temp.pre
                return
            }
            temp = temp.next!
        }
    }
    
    // 根据索引增加元素
    func insertAtIndex(index: Int, obj: Any) {
        if (index < 0 || index >= _size) { return }
        _size += 1
        
        let node = hashNode(obj: obj)
        if (_first == nil) {
            self.addNode(node: node)
            return
        }
        
        var temp: hashNode = _first!
        for i in 0..<_size {
            if (i == index) {
                temp.pre?.next = node
                node.pre = temp.pre
                node.next = temp
                temp.pre = node
                return
            }
            temp = temp.next!
        }
    }
    
    // 根据索引获取元素
    func objAtIndex(index: Int) throws -> hashNode {
        if (index < 0 || index >= _size) { throw errormsg.outOfBounds }
        
        var temp:hashNode = _first!
        for i in 0..<_size {
            if (i == index) {
                return temp
            }
            temp = temp.next!
        }
        return temp
    }
    
    func traverse() -> [Any]{
        var result: [Any] = []
        do {
            result = try traverseThrow()
        } catch errormsg.objNotFound {
            print("objNotFound")
        } catch {
            print("???")
        }
        return result
    }
    
    func traverseThrow() throws -> [Any] {
        var results: [Any] = []
        var temp:hashNode? = _first
        for _ in 0..<_size  {
            if (temp?.obj != nil) {
                results.append(temp!.obj)
            } else {
                throw errormsg.objNotFound
            }
            temp = temp?.next
        }
        return results
    }
    
}
