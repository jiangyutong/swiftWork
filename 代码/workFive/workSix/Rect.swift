//
//  Rect.swift
//  workSix
//
//  Created by jiang on 2018/11/25.
//  Copyright © 2018年 jiang. All rights reserved.
//


import UIKit
class Rect:UIView
{
// 矩形
    override func draw(_ rect: CGRect) {
        let color = UIColor.red
        color.set() // 设置线条颜色
        
        let aPath = UIBezierPath(rect: CGRect(x: 10, y: 10, width: 50, height: 60)) // 长方形
        //    let aPath = UIBezierPath(rect: CGRectMake(40, 40, 100, 100)) // 正方形
        
        aPath.lineWidth = 5.0 // 线条宽度
        aPath.lineCapStyle = .round // 线条拐角
        aPath.lineJoinStyle = .round // 终点处理
        
        aPath.stroke() // Draws line 根据坐标点连线，不填充
            //    aPath.fill() // Draws line 根据坐标点连线，填充
    }
}
