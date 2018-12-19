//
//  ViewController.swift
//  WebView
//
//  Created by jiang on 2018/12/15.
//  Copyright © 2018年 蒋宇童. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var urlTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       if  let url = URL(string: "http://www.163.com")
       {
        webView.load(URLRequest(url: url))
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func go(_ sender: Any) {
        if let url=URL(string: urlTF.text!)
        {
            webView.load(URLRequest(url: url))
        }
    }
    
    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func forword(_ sender: Any) {
        webView.goForward()
    }
    
    @IBAction func reload(_ sender: Any) {
        webView.reload()
    }
}

