//
//  detail.swift
//  dataStructure
//
//  Created by zhuxinyu on 2018/12/29.
//  Copyright © 2018 havefun. All rights reserved.
//

import Foundation
import UIKit

class detail: UIViewController {
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.title == "单链表" {
            chain()
        } else if self.title == "双向链表" {
            bothWayChain()
        } else if self.title == "约瑟夫环" {
            JosephusCircle()
        }
    }
    
    func JosephusCircle() {
        var content: String = ""
        let list = bothWayList(nodeValue: 1)
        list.addNode(nodeValue: 2)
        list.addNode(nodeValue: 3)
        list.addNode(nodeValue: 4)
        list.addNode(nodeValue: 5)
        
        var results = list.traverse()
        content = " 创建双向链表：\n \(results)"
        
        let length = list.length()
        content = "\(content) \n\n 测长：\(length)"
        
        // 约瑟夫环：解法1：循环
        func Josephus(circulation total:Int, out:Int) -> Int{
            let n = total
            let m = out
            var temp = 0
            for i in 1...n {
                print("temp = \(temp), m = \(m), i = \(i)， result = \((temp + m) % i)")
                temp = (temp + m) % i
            }
            return temp + 1
        }
        
        // 数学思路：新环是由(上一步环中编号-最大报数值)% 上一步总人数 得到的，所以逆推时可以由(新环中的数字 + 最大报数值 )% 上一步总人数 取得上一步环数
        // 约瑟夫环：解法1：递归
        func Josephus(recursion total:Int, out:Int) -> Int {
            if(total == 1) { return 0 }
            return (Josephus(recursion: total - 1, out: out) + out) % total
        }
        
        var liveMan = Josephus(circulation: 5, out: 2)
        content = "\(content) \n\n 约瑟夫环-循环：总人数5，关键数2, 存活人编号:\(liveMan)"
        
        liveMan = Josephus(recursion: 5, out: 2) + 1
        content = "\(content) \n\n 约瑟夫环-递归：总人数5，关键数2, 存活人编号:\(liveMan)"
        
        // 约瑟夫环： 解法3：双向循环链表
        liveMan = list.Josephus(out: 2)
        textView.text = "\(content) \n\n 约瑟夫环-链表：总人数\(length + 1)，关键数2, 存活人编号:\(liveMan)"
    }
    
    func bothWayChain() {
        var content: String = ""
        let list = bothWayList(nodeValue: 1)
        list.addNode(nodeValue: 2)
        list.addNode(nodeValue: 3)
        list.addNode(nodeValue: 4)
        list.addNode(nodeValue: 5)
        list.addNode(nodeValue: 6)
        list.addNode(nodeValue: 7)
        
        var results = list.traverse()
        content = " 创建双向链表：\n \(results)"
        
        list.removeNode(nodeValue: 5)
        results = list.traverse()
        content = "\(content) \n\n 删除值为5的节点: \(results)"
        
        let length = list.length()
        content = "\(content) \n\n 测长：\(length)"
        
        if length > 1 {
            list.reverse()
            results = list.traverse()
            let str: String = "\(content) \n\n 反转：\(results)"
            content = str.replacingOccurrences(of: "\"", with: "")
        }
    }
    
    func chain() {
        var content: String = ""
        let list = LinkedList(nodeValue: 1)
        list.addNode(withValue: 2)
        list.addNode(withValue: 3)
        list.addNode(withValue: 4)
        list.addNode(withValue: 5)
        list.addNode(withValue: 6)
        list.addNode(withValue: 7)
        
        var results = list.traverse()
        content = " 创建单链表: \(results)"
        
        list.removeNode(withValue: 5)
        results = list.traverse()
        content = "\(content) \n\n 删除值为5的节点: \(results)"
        
        let length = list.length()
        content = "\(content) \n\n 测长：\(length)"
        
        if length > 1 {
            list.reverse()
            results = list.traverse()
            content = "\(content) \n\n 反转：\(results)"
        }
        
        list.removeHead()
        results = list.traverse()
        content = "\(content) \n\n 删除头结点: \(results)"
        textView.text = content
    }
}
