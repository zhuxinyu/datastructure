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
    override func viewDidLoad() {
        super.viewDidLoad()
        let list = LinkedList(nodeValue: 4)
        list.addNode(withValue: 3)
        list.addNode(withValue: 5)
        list.addNode(withValue: 6)
        
        var results = list.traverse()
        print("创建单链表: \(results)")
        
//        list.removeNode(withValue: 5)
//        results = list.traverse()
//        print("删除值为5的节点: \(results)")
        
        let length = list.length()
        print("测长：\(length)")
        
        if length > 1 {
            list.reverse()
            results = list.traverse()
            print("反转：\(results)")
        }
        
    }
}
