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
        let results = list.traverse()
        print(results)
    }
}
