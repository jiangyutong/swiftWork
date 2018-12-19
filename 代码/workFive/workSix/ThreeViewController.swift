//
//  ThreeViewController.swift
//  workSix
//
//  Created by jiang on 2018/10/21.
//  Copyright © 2018年 jiang. All rights reserved.
//

import UIKit

class ThreeViewController: UIViewController {
    var timer: Timer?// 计时器
    var triangle = Triangle(frame:CGRect(x: 10, y: 350, width: 150, height: 150))
    var  ellipse=Ellipse(frame: CGRect(x: 250, y: 300, width:  150, height: 200))
 var myview=myView(frame: CGRect(x: 20, y: 100, width: 150, height: 150))
    var rect=Rect(frame:CGRect(x: 10, y: 350, width: 150, height: 150))
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="第三场景"
        view.backgroundColor=UIColor.brown
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self,
                                     selector:#selector(reDrawView), userInfo: nil, repeats: true)
       view.addSubview(myview)
        view.addSubview(ellipse)
        view.addSubview(triangle)
        //view.addSubview(rect)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func reDrawView() {
        myview.setNeedsDisplay() // 重绘界面
        // 画完一圈后停止
        if myview.finishAngle > myview.beginAngle+Double.pi*2 {
            timer?.invalidate() // 停止计时器
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
