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
