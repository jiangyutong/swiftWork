//
//  Triangle.swift
//  workSix
//
//  Created by jiang on 2018/11/26.
//  Copyright © 2018年 jiang. All rights reserved.
//

import UIKit

class Triangle: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func draw(_ rect: CGRect) { // 五边形
        let color = UIColor.red
        color.set() // 设置线条颜色
        
        let aPath = UIBezierPath()
        
        aPath.lineWidth = 5.0 // 线条宽度
        aPath.lineCapStyle = .round // 线条拐角
        aPath.lineJoinStyle = .round // 终点处理
        
        // Set the starting point of the shape.
        aPath.move(to: CGPoint(x: 25, y: 0))
        
        // Draw the lines
        aPath.addLine(to: CGPoint(x: 0, y: 40))
        aPath.addLine(to: CGPoint(x: 50, y: 40))
        // aPath.addLine(to: CGPoint(x: 40, y: 140))
      //aPath.addLine(to: CGPoint(x: 10, y: 40))
       aPath.close() // 最后一条线通过调用closePath方法得到
        
        aPath.stroke() // Draws line 根据坐标点连线，不填充
        //    aPath.fill() // Draws line 根据坐标点连线，填充
    }
}
