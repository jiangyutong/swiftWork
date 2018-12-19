//
//  CityInfoViewController.swift
//  exp13_3
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 Jxkicker. All rights reserved.
//

import UIKit
import Alamofire

class CityWeatherViewController: UIViewController {

    let citycode:[String:String] = ["北京":"101010100","成都":"101270101","重庆":"101040100","上海":"101020100","天津":"101030100","黑龙江":"101050101"]
    let citise = ["北京": "101010100", "上海": "101020100", "天津": "101030100", "重庆": "101040100", "哈尔滨": "101050101", "长春": "101060101", "沈阳": "101070101", "呼和浩特": "101080101", "石家庄": "101090101", "太原": "101100101", "西安": "101110101", "济南": "101120101", "乌鲁木齐": "101130101", "拉萨": "101140101", "西宁": "101150101", "兰州": "101160101", "银川": "101170101", "郑州": "101180101", "南京": "101190101", "武汉": "101200101", "杭州": "101210101", "合肥": "101220101", "福州": "101230101", "南昌": "101240101", "长沙": "101250101", "贵阳": "101260101", "成都": "101270101", "广州": "101280101", "昆明": "101290101", "南宁": "101300101", "海口": "101310101", "香港": "101320101", "澳门": "101330101", "台北县": "101340101"]
    
    
    var cityinfo:Cityinfo?
    var sendcityname:String?
    
    @IBOutlet weak var pm25status: UILabel!
    @IBOutlet weak var shidustatus: UILabel!
    @IBOutlet weak var wendu: UILabel!
    @IBOutlet weak var updatetime: UILabel!
    @IBOutlet weak var nowtime: UILabel!
    @IBOutlet weak var quality: UILabel!
    @IBOutlet weak var advice: UILabel!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.update()
    
    }
    
    func update(){
       
        pm25status.text =   (cityinfo?.pm25)!
        shidustatus.text =  (cityinfo?.shidu)!
        wendu.text =  (cityinfo?.wendu)!
        updatetime.text =  (cityinfo?.updateTime)!
        nowtime.text =  (cityinfo?.time)!
        quality.text =  (cityinfo?.quality)!
        advice.text =   (cityinfo?.ganmaoadvice)!
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
