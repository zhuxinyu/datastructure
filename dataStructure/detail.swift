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
        } else if self.title == "回文字符串" {
            plalindrome()
        } else if self.title == "散列表" {
            hashListDic()
        } else if self.title == "顺序栈" {
            sequenceStack()
        } else if self.title == "顺序队列" {
            sequenceQueue()
        } else if self.title == "链式栈" {
            linkStack()
        } else if self.title == "链式队列" {
            linkQueue()
        } else if self.title == "循环队列" {
            circulationQueue()
        } else if self.title == "用栈实现队列" {
            stackableQueue()
        } else if self.title == "表达式求值" {
            calculator()
        } else if self.title == "冒泡排序" {
            bubblingsort()
        } else if self.title == "插入排序" {
            insertSort()
        } else if self.title == "选择排序" {
            selectSort()
        } else if self.title == "希尔排序" {
            shellSort()
        } else if self.title == "归并排序" {
            mergeSort()
        } else if self.title == "快速排序" {
            quickSort()
        } else if self.title == "桶排序" {
            heapSort()
        } else if self.title == "计数排序" {
            countingSort()
        } else if self.title == "基数排序" {
            radixSort()
        }
    }
    
    func radixSort() {
        var content: String = ""
        var data:[Int] = [5555,634,422,411111,3,5,20,0,1]
        content = " 原始数据：\n \(data)"
        data.radixSort()
        
        content = "\(content) \n\n 基数排序: \n\n \(data) \n 平均时间复杂度O(dn) d是维度 稳定"
        textView.text = content
    }
    
    func countingSort() {
        var content: String = ""
        let data:[Int] = [5,6,4,4,3,5,2,0,1]
        content = " 原始数据：\n \(data)"
        let result = sorting().countSort(array: data)
        content = "\(content) \n\n 计数排序: \n\n \(result) \n 平均时间复杂度O(n*logn)"
        textView.text = content
    }
    
    func heapSort() {
        var content: String = ""
        let data:[Int] = [5,6,4,7,3,8,2,9,1]
        content = " 原始数据：\n \(data)"
        let mainHeap = Heap<Int>(sort: >, elements: data)
//        mainHeap.insert("lad01")
//        mainHeap.insert("lad05")
//        mainHeap.insert("lad03")
//        mainHeap.insert("lad04")
//        mainHeap.insert("lad02")
//        mainHeap.insert("lad06")
//        mainHeap.insert("lad07")

        
        content = "\(content) \n\n 桶排序: \n\n \(mainHeap.sorted()) \n 平均时间复杂度O(n)"
        textView.text = content
    }
    
    func quickSort() {
        var content: String = ""
        var data:[Int] = [5,6,4,7,3,8,2,9,1]
        content = " 原始数据：\n \(data)"
        
        sorting().quicksortHoare(&data, low: 0, high: data.count - 1)
        content = "\(content) \n\n 快速排序: \n\n \(data) \n 平均时间复杂度O(n+k) k是数据范围 稳定"
        textView.text = content
    }
    
    func mergeSort() {
        var content: String = ""
        let data:[Int] = [5,6,4,7,3,8,2,9,1]
        content = " 原始数据：\n \(data)"
        
        let result = sorting().mergeSort(data)
        content = "\(content) \n\n 归并排序: \n\n \(result) \n 平均时间复杂度O(n*logn) 稳定"
        textView.text = content
    }
    
    func shellSort() {
        var content: String = ""
        var data:[Int] = [5,6,4,7,3,8,2,9,1]
        content = " 原始数据：\n \(data)"
        
        sorting().shell(&data)
        content = "\(content) \n\n 希尔排序: \n\n \(data) \n 平均时间复杂度O(n^(0..1)) 不稳定"
        textView.text = content
    }
    
    func selectSort(){
        var content: String = ""
        let data:[Int] = [5,6,4,7,3,8,2,9,1]
        content = " 原始数据：\n \(data)"
        
        let selectSort:[Int] = sorting().select(data: data)
        content = "\(content) \n\n 选择排序: \n\n \(selectSort) \n 平均时间复杂度O(n^2) 不稳定"
        textView.text = content
    }
    
    func bubblingsort() {
        var content: String = ""
        let data:[Int] = [5,6,4,7,3,8,2,9,1]
        content = " 原始数据：\n \(data)"

        let bubbling:[Int] = sorting().bubbling(data: data)
        content = "\(content) \n\n 冒泡排序: \n\n \(bubbling) \n 平均时间复杂度O(n^2) 稳定"
        textView.text = content
    }
    
    func insertSort(){
        var content: String = ""
        let data:[Int] = [5,6,4,7,3,8,2,9,1]
        content = " 原始数据：\n \(data)"
     
        let insertSort:[Int] = sorting().insert(data)
        content = "\(content) \n\n 插入排序: \n\n \(insertSort) \n 平均时间复杂度O(n^2) 稳定"
        textView.text = content
    }
    
    func calculator() {
        var content: String = ""
        let stack:evalStack = evalStack()
        content = "创建求值栈：\n \(stack.result)"
        
        stack.pushNum(value: 2)
        stack.pushOperator(op: 1)
        stack.pushNum(value: 3)
        stack.pushOperator(op: 2)
        stack.pushNum(value: 5)
        content = "\(content) \n\n 数字队列：\(String(describing: stack.numStack?.traverse())) 操作符队列:\(String(describing: stack.operatorStack?.traverse()))"

        let result = stack.eval()
        content = "\(content) \n\n 结果: \(result)"
        textView.text = content
    }
    
    func stackableQueue() {
        var content: String = ""
        let queue: stackQueue = stackQueue()
        content = " 创建链式栈：\n \(String(describing: queue.deStack?.traverse()))"
        
        queue.enqueue(value: 1)
        queue.enqueue(value: 2)
        queue.enqueue(value: 3)
        queue.enqueue(value: 4)
        queue.enqueue(value: 5)
        
        content = "\(content) \n\n 入队对象1, 2，3，4，5：\n \(String(describing: queue.enStack?.traverse()))"
        
        var obj = queue.dequeue()
        content = "\(content) \n\n 出队对象：\(String(describing: obj?.value)) 出队结果: \(String(describing: queue.deStack?.traverse())) \n 入队结果： \(String(describing: queue.enStack?.traverse()))"
        
        queue.enqueue(value: 6)
        
        content = "\(content) \n\n 入队对象：6 出队结果: \(String(describing: queue.deStack?.traverse())) \n 入队结果： \(String(describing: queue.enStack?.traverse()))"
        
        obj = queue.dequeue()
        content = "\(content) \n\n 出队对象：\(String(describing: obj?.value)) 出队结果: \(String(describing: queue.deStack?.traverse())) \n 入队结果： \(String(describing: queue.enStack?.traverse()))"
        textView.text = content
    }
    
    func circulationQueue(){
        var content: String = ""
        let queue: queueCycle = queueCycle(size: 6)
        content = " 创建循环队列：\n \(queue.traverse()) 队列容量: \(queue.size)"
        
        queue.enqueue(value: 1)
        queue.enqueue(value: 2)
        queue.enqueue(value: 3)
        queue.enqueue(value: 4)
        queue.enqueue(value: 5)
        queue.enqueue(value: 6)
        queue.enqueue(value: 7)
        
        content = "\(content) \n\n 入队对象1, 2，3，4，5, 6, 7：\n 队列长度：\(queue.length) \n \(queue.traverse())"
        
        var obj = queue.dequeue()
        content = "\(content) \n\n 出队对象：\(String(describing: obj?.value)) \n 队列长度：\(queue.length) 队列结果: \(queue.traverse())"
        
        obj = queue.dequeue()
        content = "\(content) \n\n 出队对象：\(String(describing: obj?.value)) \n 队列长度：\(queue.length) 队列结果: \(queue.traverse())"
        
        queue.enqueue(value: 7)
        content = "\(content) \n\n 入队对象：7 \n 队列长度：\(queue.length) 队列结果: \(queue.traverse())"
        textView.text = content
    }
    
    func linkQueue() {
        var content: String = ""
        let queue: linkedQueue = linkedQueue()
        content = " 创建链式栈：\n \(queue.traverse())"
    
        queue.enqueue(value: 1)
        queue.enqueue(value: 2)
        queue.enqueue(value: 3)
        queue.enqueue(value: 4)
        queue.enqueue(value: 5)
        
        content = "\(content) \n\n 入队对象1, 2，3，4，5：\n \(queue.traverse())"
        
        var obj = queue.dequeue()
        content = "\(content) \n\n 出队对象：\(String(describing: obj?.value)) 队列结果: \(queue.traverse())"
        
        obj = queue.dequeue()
        content = "\(content) \n\n 出队对象：\(String(describing: obj?.value)) 队列结果: \(queue.traverse())"
        textView.text = content
    }
    
    func linkStack() {
        var content: String = ""
        let stack: linkedStack = linkedStack()
        content = " 创建链式栈：\n \(stack.traverse())"
        
        stack.push(value: 1)
        stack.push(value: 2)
        stack.push(value: 3)
        stack.push(value: 4)
        stack.push(value: 5)
        
        content = "\(content) \n\n 压栈对象1, 2，3，4，5：\n \(stack.traverse())"
        
        var obj = stack.pop()
        content = "\(content) \n\n 出栈对象：\(String(describing: obj?.value)) 栈结果: \(stack.traverse())"
        
        obj = stack.pop()
        content = "\(content) \n\n 出栈对象：\(String(describing: obj?.value)) 栈结果: \(stack.traverse())"
        textView.text = content
    }
    
    func sequenceStack() {
        var content: String = ""
        var stack = IntegerStack()
        content = " 创建顺序栈：\n \(stack)"
        
        stack.push(1)
        stack.push(2)
        stack.push(3)
        stack.push(4)
        stack.push(5)
        content = "\(content) \n\n 压栈对象1, 2，3，4，5：\n \(stack)"
        
        var obj = stack.pop()
        content = "\(content) \n\n 出栈对象：\(String(describing: obj)) 栈结果: \(stack)"
        
        obj = stack.pop()
        content = "\(content) \n\n 出栈对象：\(String(describing: obj)) 栈结果: \(stack)"
        textView.text = content
    }
    
    func sequenceQueue() {
        var content: String = ""
        var queue = IntegerQueue()
        content = " 创建顺序队列：\n \(queue)"
        
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        queue.enqueue(4)
        queue.enqueue(5)
        content = "\(content) \n\n 入队对象1, 2,3,4,5：\n \(queue)"
        
        var obj = queue.dequeue()
        content = "\(content) \n\n 出队对象：\(String(describing: obj)) 队列结果: \(queue)"
        
        obj = queue.dequeue()
        content = "\(content) \n\n 出队对象：\(String(describing: obj)) 队列结果: \(queue)"
        textView.text = content
    }
    
    func hashListDic() {
        var content: String = ""
        let list = arrayList(withObj: 1)
        var results = list.traverse()
        content = " 创建数组：\n \(results)"
 
        list.addNode(withObj: 2)
        results = list.traverse()
        content = "\(content) \n\n 增加对象：\n \(results)"
        
        list.insertAtIndex(index: 1, obj: 3)
        results = list.traverse()
        content = "\(content) \n\n 插入对象在第2个位置：\n \(results)"
        
        list.removeAtIndex(index: 1)
        results = list.traverse()
        content = "\(content) \n\n 删除对象在第2个位置：\n \(results)"
        
        let dic:hashDic = hashDic()
        dic.setValueforKey(value: 3, key: "test")
        let data: arrayList = dic._keys._first?.obj as! arrayList
        let r = data._first?.obj as! hashNode
        content = "\(content) \n\n 字典：存入key: \(r.key) value: \(r.value)"
        
        let value:Any? = dic.valueForKey(key: r.key)
        content = "\(content) \n\n 字典：取出key: \(r.key) value: \(String(describing: value))"

        textView.text = content
    }
    
    func plalindrome() {
        var content: String = ""
        let list = LinkedList(nodeValue: 1)
        list.addNode(withValue: 2)
        list.addNode(withValue: 3)
        list.addNode(withValue: 3)
        list.addNode(withValue: 2)
        list.addNode(withValue: 1)
        
        let results = list.traverse()
        content = " 创建单链表：\n \(results)"
        
        let isP:String = list.isPlalindrome() ? "是" : "否"
        content = "\(content) \n\n 是否回文：\(isP)"
        
        textView.text = content
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
//                print("temp = \(temp), m = \(m), i = \(i)， result = \((temp + m) % i)")
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
        textView.text = content
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
