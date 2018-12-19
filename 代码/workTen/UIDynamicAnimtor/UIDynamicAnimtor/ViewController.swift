//
//  ViewController.swift
//  UIDynamicAnimtor
//
//  Created by jiang on 2018/11/21.
//  Copyright © 2018年 jiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer :Timer?
    lazy var animation = UIDynamicAnimator(referenceView: self.myView)
    let gravity = UIGravityBehavior()
    let collision = UICollisionBehavior()
    @IBOutlet weak var myView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        animation.addBehavior(gravity)
        animation.addBehavior(collision)
        collision.translatesReferenceBoundsIntoBoundary=true
        // Do any additional setup after loading the view, typically from a nib.
       
        //timer?.invalidate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func add(_ sender: UIButton) {
        let width = Int(myView.bounds.width/10)
        let randx = Int(arc4random()%10)*width
        let lable = UILabel(frame: CGRect(x: randx, y: 0, width: width, height: width))
        lable.backgroundColor=#colorLiteral(red: 1, green: 0.6215450618, blue: 0.9306755428, alpha: 1)
        lable.text="jyt"
        lable.textAlignment = .center
        myView.addSubview(lable)
        gravity.addItem(lable)
        collision.addItem(lable)
    }
    
    @IBAction func up(_ sender: UIButton) {
        gravity.gravityDirection=CGVector(dx: 0, dy: -1)
    }
    
    @IBAction func down(_ sender: UIButton) {
        gravity.gravityDirection=CGVector(dx: 0, dy: 1)
    }
    
    @IBAction func left(_ sender: UIButton) {
        gravity.gravityDirection=CGVector(dx: -1, dy: 0  )
    }
    
    @IBAction func right(_ sender: UIButton) {
        gravity.gravityDirection=CGVector(dx: 1, dy: 0  )
    }
    
    @IBAction func mydelete(_ sender: Any) {
        for lable in myView.subviews
        {
            if lable is UILabel
            {
                gravity.removeItem(lable)
                collision.removeItem(lable)
                lable.removeFromSuperview()
            }
        }
        
    }
    
}

