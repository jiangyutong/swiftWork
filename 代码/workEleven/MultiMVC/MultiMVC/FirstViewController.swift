//
//  ViewController.swift
//  MultiMVC
//
//  Created by jiang on 2018/12/14.
//  Copyright © 2018年 蒋宇童. All rights reserved.
//


import UIKit


class FirstViewController: UIViewController {
  var stu = Student()

    @IBOutlet weak var tfNo: UITextField!
    @IBOutlet weak var tfName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tfNo.text = stu.no
        tfName.text = stu.name
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Second"
        {
            stu.no=tfNo.text!
            stu.name=tfName.text!
            let secVC = segue.destination as!SecondViewController
            secVC.stu=stu
        }
    }
    
//    @IBAction func showSecondVC(_ sender: Any) {
//       stu.no = tfNo.text!
//        stu.name = tfName.text!
//        
//        let secVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
//        secVC.stu=stu
//    
//        
//        self.navigationController?.pushViewController(secVC, animated: true)
//    }
//    
//    @IBAction func showThirdVC(_ sender: Any) {
//        let thirdVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdVC")
//        present(thirdVC, animated: true, completion: nil)
//    }
}

