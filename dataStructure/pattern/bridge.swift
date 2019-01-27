//
//  bridge.swift
//  dataStructure
//
//  Created by zhuxinyu on 2019/1/27.
//  Copyright © 2019 havefun. All rights reserved.
//

import Foundation

protocol GraphicsAPI {
    func drawRectangle(_ x: Int, _ y:Int, _ width:Int, _ height:Int)
    func drawCircle(_ x:Int, _ y:Int, _ radius:Int)
}

public class Shape {
    let graphicsApi: GraphicsAPI
    
    init(_ graphicsApi: GraphicsAPI) {
        self.graphicsApi = graphicsApi
    }
    
    func draw() {
        
    }
}

public class Circle:Shape {
    var x: Int = 0
    var y: Int = 0
    var radius: Int = 0
    
    convenience init(_ x:Int, _ y:Int, _ radius:Int, _ graphicsApi:GraphicsAPI) {
        self.init(graphicsApi)
        self.x = x
        self.y = y
        self.radius = radius
    }
    
    override func draw() {
        self.graphicsApi.drawCircle(self.x, self.y, self.radius)
    }
}

public class Rectangle:Shape {
    var x: Int = 0
    var y: Int = 0
    var width: Int = 0
    var height: Int = 0
    
    convenience init(_ x:Int, _ y:Int, _ width:Int, _ height:Int, _ graphicsApi:GraphicsAPI) {
        self.init(graphicsApi)
        self.x = x
        self.y = y
        self.width = width
        self.height = height
    }
    
    override func draw() {
        self.graphicsApi.drawRectangle(self.x, self.y, self.width, self.height)
    }
}

class DirectXAPI: GraphicsAPI {
    func drawRectangle(_ x: Int, _ y: Int, _ width: Int, _ height: Int) {
        print("Rectangle drawn by DirectXAPI API");
    }
    
    func drawCircle(_ x: Int, _ y: Int, _ radius: Int) {
        print("Circle drawn by DirectXAPI API");
    }
}
