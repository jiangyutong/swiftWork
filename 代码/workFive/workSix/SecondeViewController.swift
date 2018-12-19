//
//  SecondeViewController.swift
//  workSix
//
//  Created by jiang on 2018/10/21.
//  Copyright © 2018年 jiang. All rights reserved.
//

import UIKit

class SecondeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="第二场景"
        view.backgroundColor=UIColor.blue
        let imageview=UIImageView(frame: CGRect(x: 0, y: 100, width:400, height: 400))
        imageview.image=UIImage(named: "baiyun")
        view.addSubview(imageview)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
