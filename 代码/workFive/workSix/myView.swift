//
//  myView.swift
//  workSix
//
//  Created by jiang on 2018/10/21.
//  Copyright © 2018年 jiang. All rights reserved.
//

import UIKit

class myView: UIView {
    var beginAngle = Double.pi*3/2 // 起点
    var finishAngle = Double.pi*3/2+Double.pi*2/20 // 终点
    
    override func draw(_ rect: CGRect) {
        self.backgroundColor=UIColor.gray
        let color = UIColor.blue
        color.set() // 设置线条颜色
        
        let aPath = UIBezierPath(arcCenter: CGPoint(x: 50, y: 50), radius: 40, startAngle: (CGFloat)(beginAngle), endAngle: (CGFloat)(finishAngle), clockwise: true)
        aPath.addLine(to: CGPoint(x: 50, y:50))
        aPath.close()
        aPath.lineWidth = 5.0 // 线条宽度
        aPath.fill() // Draws line 根据坐标点连线，填充
        
        finishAngle += Double.pi/20 // 更新终点
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    }
}
