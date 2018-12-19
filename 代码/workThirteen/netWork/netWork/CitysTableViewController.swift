//
//  CitysTableViewController.swift
//  exp13_3
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 Jxkicker. All rights reserved.
//

import UIKit
import Alamofire




class CitysTableViewController: UITableViewController {

    var cityinfo = Cityinfo()
    let citise = ["北京": 101010100, "上海": 101020100, "天津": 101030100, "重庆": 101040100, "哈尔滨": 101050101, "长春": 101060101, "沈阳": 101070101, "呼和浩特": 101080101, "石家庄": 101090101, "太原": 101100101, "西安": 101110101, "济南": 101120101, "乌鲁木齐": 101130101, "拉萨": 101140101, "西宁": 101150101, "兰州": 101160101, "银川": 101170101, "郑州": 101180101, "南京": 101190101, "武汉": 101200101, "杭州": 101210101, "合肥": 101220101, "福州": 101230101, "南昌": 101240101, "长沙": 101250101, "贵阳": 101260101, "成都": 101270101, "广州": 101280101, "昆明": 101290101, "南宁": 101300101, "海口": 101310101, "香港": 101320101, "澳门": 101330101, "台北县": 101340101]
    
    let Citys = ["成都","北京","上海","重庆","天津","黑龙江"]

    let url = URL(string:"http://t.weather.sojson.com/api/weather/city/101270101")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return citise.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = Array(citise.keys)[indexPath.row]
        cell.detailTextLabel?.text="\(Array(citise.values)[indexPath.row])"
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextPage = segue.destination as? CityWeatherViewController{
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell){
                 let number = "\(Array(citise.values)[indexPath.row])"
                let url_ = "http://t.weather.sojson.com/api/weather/city/\(number ?? "101270101")"
                let url = URL(string:url_)!
                AF.request(url).responseJSON {(response) in
                    
                    let json_ = response.result.value as! Dictionary<String,AnyObject>
                    let cityInfo = json_["cityInfo"]  as! Dictionary<String,AnyObject>
                    
                    
                    let todayinfo = json_["data"] as! Dictionary<String,AnyObject>
                    // 2.得到湿度
                    self.cityinfo.shidu = todayinfo["shidu"] as! String
                    // 3.得到pm25
                    self.cityinfo.pm25 = "\(todayinfo["pm25"] as! Int)"
                    // 4.得到建议
                    self.cityinfo.ganmaoadvice = todayinfo["ganmao"] as! String
                    // 5.得到时间
                    self.cityinfo.time = json_["time"] as! String
                    // 6.得到空气质量
                    self.cityinfo.quality = todayinfo["quality"] as! String
                    // 7.得到更新时间
                    self.cityinfo.updateTime = cityInfo["updateTime"] as! String
                    // 8.获取温度
                    self.cityinfo.wendu = todayinfo["wendu"] as! String
                    self.cityinfo.getcity=Array(self.citise.keys)[(self.tableView.indexPathForSelectedRow?.row)!]
                }
                nextPage.cityinfo=cityinfo
                print("dsdjks\(cityinfo.wendu)")
                 print(cityinfo.getcity)
               
            }
        }
    }
 

}
