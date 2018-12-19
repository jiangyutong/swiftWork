//
//  ViewController.swift
//  Thread
//
//  Created by jiang on 2018/12/15.
//  Copyright © 2018年 蒋宇童. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbcount: UILabel!
    @IBOutlet weak var lbSum: UILabel!
    var count=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.count+=1
            self.lbcount.text="\(self.count)"
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func sum(_ sender: Any) {
        var sum=0;
        DispatchQueue.global().async {
            print("1")
            for i in 1...99999999
            {
                sum += i
            }
            DispatchQueue.main.async {
                self.lbSum.text = "\(sum)"
                print("1")
            }
            
        }
        
        
        }
       
        

}

