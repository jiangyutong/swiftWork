//
//  Ellipse.swift
//  workSix
//
//  Created by jiang on 2018/11/25.
//  Copyright © 2018年 jiang. All rights reserved.
//

import UIKit



    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    class Ellipse:UIView
    {
        override func draw(_ rect: CGRect) {
            let color = UIColor.red
            color.set() // 设置线条颜色
            
            // 根据传入的矩形画出内切圆／椭圆
            //    let aPath = UIBezierPath(ovalInRect: CGRectMake(40, 40, 100, 100)) // 如果传入的是正方形，画出的就是内切圆
            let aPath = UIBezierPath(ovalIn: CGRect(x: 10, y: 10, width: 100, height: 150))// 如果传入的是长方形，画出的就是内切椭圆
            
            aPath.lineWidth = 5.0 // 线条宽度
            
            aPath.stroke() // Draws line 根据坐标点连线，不填充
                    aPath.fill() // Draws line 根据坐标点连线，填充
           
        }
      
    }

