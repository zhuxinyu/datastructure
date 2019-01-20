//
//  list.swift
//  dataStructure
//
//  Created by zhuxinyu on 2018/12/29.
//  Copyright © 2018 havefun. All rights reserved.
//

import Foundation
import UIKit

enum type: String {
    case chain, stack, recursion, sort
}

class list: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var chain:[String] = ["单链表", "双向链表", "散列表", "约瑟夫环", "回文字符串"]
    lazy var stack:[String] = ["顺序栈", "链式栈","顺序队列", "链式队列", "循环队列", "用栈实现队列", "表达式求值"]
    lazy var recursion:[String] = ["递归和循环实现相同的功能", "内存检测", "环监测"]
    lazy var sort:[String] = ["冒泡排序", "插入排序", "选择排序", "希尔排序", "归并排序", "快速排序", "桶排序", "计数排序", "基数排序"]
    
    lazy var dataSource:[String] = { [unowned self] in
        switch type(rawValue:typeStr)! {
        case .chain: return chain
        case .stack: return stack
        case .recursion: return recursion
        case .sort: return sort
        }
    }()
    lazy var typeStr: String = self.title!
    
    @IBOutlet weak var listView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        cell.textLabel?.textColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! detail
        if let cell = sender as? UITableViewCell, let indexPath = listView.indexPath(for: cell) {
            controller.title = dataSource[indexPath.row]
        }
    }
}
