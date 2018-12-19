//
//  ViewController.swift
//  exp13_3
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 Jxkicker. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var webpage: UIImageView!
    
    
    @IBAction func loadPage(_ sender: UIButton) {
        asyncLoadURLSession()
    }
    @IBAction func loadAlamofire(_ sender: UIButton) {
        asyncLoadImageByAlamofire()
    }
    
    func asynloadImageByURL(){
        DispatchQueue.global().async {
            if let url = URL(string:"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544887484900&di=6f0b90c57252f42f89f6ba7dad1dc0fc&imgtype=0&src=http%3A%2F%2Fimg1.3lian.com%2F2015%2Fa1%2F18%2Fd%2F190.jpg"){
                if let data = try? Data(contentsOf:url){
                    DispatchQueue.main.async {
                        self.webpage.image = UIImage(data:data)
                    }
                    
                }
            }
        }
    }
    
    func asyncLoadURLSession(){
        if let url = URL(string:"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544887484900&di=6f0b90c57252f42f89f6ba7dad1dc0fc&imgtype=0&src=http%3A%2F%2Fimg1.3lian.com%2F2015%2Fa1%2F18%2Fd%2F190.jpg"){
            let task = URLSession.shared.dataTask(with: url){(data,response,error) in
                DispatchQueue.main.async {
                    self.webpage.image = UIImage(data : data!)
                }
            }
            task.resume()
        }
    }
    
    func asyncLoadImageByAlamofire(){
        if let url = URL(string:"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544887484900&di=6f0b90c57252f42f89f6ba7dad1dc0fc&imgtype=0&src=http%3A%2F%2Fimg1.3lian.com%2F2015%2Fa1%2F18%2Fd%2F190.jpg"){
            AF.request(url).responseData { (respose) in
                self.webpage.image = UIImage(data: respose.data!)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        asynloadImageByURL()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

