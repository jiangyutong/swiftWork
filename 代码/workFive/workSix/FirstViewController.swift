//
//  FirstViewController.swift
//  workSix
//
//  Created by jiang on 2018/10/21.
//  Copyright © 2018年 jiang. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var lable=UILabel(frame: CGRect(x: 130, y: 200, width: 100, height: 40))
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem=UIBarButtonItem(title: "go to >", style: UIBarButtonItemStyle.plain, target: self, action: #selector(click2))
        self.title="第一场景"
       
        view.backgroundColor=UIColor.purple
        lable.backgroundColor=UIColor.brown
        lable.textColor=UIColor.white
        lable.textAlignment = .center
        lable.text="蒋宇童"
        lable.alpha=0.5
        view.addSubview(lable)
        let button=UIButton(frame: CGRect(x: 80, y: 300, width: 200, height: 50))
        button.setTitle("变内容", for: .normal)
        button.backgroundColor=UIColor.darkGray
        button.addTarget(self, action: #selector(click), for: UIControlEvents.touchUpInside)
        button.alpha=0.7
        view.addSubview(button)
        let button2=UIButton(frame: CGRect(x: 80, y: 400, width: 200, height: 50))
        button2.setTitle("To第二场景", for: .normal)
        button2.backgroundColor=UIColor.darkGray
        button2.addTarget(self, action: #selector(click2), for: UIControlEvents.touchUpInside)
        button.alpha=0.7
        view.addSubview(button2)
        // Do any additional setup after loading the view.
    }
    @IBAction func nextPage()
    {
        let sv=SecondeViewController()
        self.navigationController?.pushViewController((sv), animated: true)
    }
    @IBAction func click()
    {
        
       lable.text="I am click"
    }
    @IBAction func click2()
    {
       
        let sv=SecondeViewController()
        self.navigationController?.pushViewController((sv), animated: true)
        //self.presentingViewController?.dismiss(animated: true, completion: nil)
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
