//
//  ViewController.swift
//  UIView.animation
//
//  Created by jiang on 2018/11/21.
//  Copyright © 2018年 jiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    let imageView = UIImageView(frame: CGRect(x: 20, y: 20, width: 100, height: 100))
   
    override func viewDidLoad() {
        super.viewDidLoad()
         imageView.image=UIImage(named: "1")
        //myView2=myView
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func btnClicked(_ sender: UIButton) {
        
        if myView == nil
        {
            
        }
        else
        {
            UIView.animate(withDuration: 4, delay: 1, options: [.curveLinear,.autoreverse], animations: {
                
                self.myView.backgroundColor=#colorLiteral(red: 0.4867877364, green: 0.7669275999, blue: 0.932189405, alpha: 1)
                self.myView.center.x=self.view.bounds.width/2
                self.myView.transform = CGAffineTransform(scaleX: 5, y:5)
                self.myView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
                self.myView.transform = CGAffineTransform.identity
                self.myView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
                self.myView.transform = CGAffineTransform.identity
                self.myView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
                self.myView.transform = CGAffineTransform.identity
                self.myView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
                self.myView.transform = CGAffineTransform.identity
                self.myView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
                self.myView.transform = CGAffineTransform.identity
                self.myView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
                self.myView.transform = CGAffineTransform.identity
                
                
            },completion: nil)
        }
      
        
    }
   
    @IBAction func btnClickedTwo(_ sender: UIButton) {
     
        if myView == nil
        {
            
        }
        else
        {
            UIView.transition(with: myView, duration: 2, options: .transitionCurlUp, animations: {
                self.myView.backgroundColor=#colorLiteral(red: 0.9610558152, green: 0.5509537458, blue: 0.01276976243, alpha: 1)
                self.myView.transform = CGAffineTransform(scaleX: 4, y: 4)
            }, completion: nil)
        }
        
        
        
    }
    
    @IBAction func btnClickedThree(_ sender: UIButton) {
       
        if myView == nil
        {
            
        }
        else
        {
        UIView.transition(from: myView, to: imageView, duration: 2, options: .transitionFlipFromRight, completion: nil)
        }
    }
}

