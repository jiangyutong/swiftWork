//: Playground - noun: a place where people can play

import UIKit

/*
 1.    显示当前准确的中文时间，包括北京、东京、纽约、伦敦，格式为（2016年9月28日星期三 上午10:25）
 a)    显示中文需要设置locale
 
 */
func getDate(date: Date, zone: Int = 0) -> String {
    let formatter = DateFormatter()  //实例化格式化类
    formatter.dateFormat = "yyyy年MM月dd日EEEE aa KK:mm"  //指定格式化的格式
    formatter.locale = Locale.current  //设置当前位置，可以将对应的星期数和12小时制的上下午设置为中文
    if zone >= 0 { //当传入的为正数时，在东半区
        formatter.timeZone = TimeZone(abbreviation: "UTC+\(zone):00")
    } else {  //当传入的为负数时，在西半区
        formatter.timeZone = TimeZone(abbreviation: "UTC\(zone):00")
    }
    
    let dateString = formatter.string(from: date)  //将传入的日期格式化为字符串
    return dateString
}
let now = Date()  //获取当前时间日期

let beijing = getDate(date: now, zone: 8)  //获取当前北京的时间
print("北京: \(beijing)")

let tokyo = getDate(date: now, zone: 9)  //获取当前东京的时间
print("东京: \(tokyo)")

let newYork = getDate(date: now, zone: -5)  //获取当前纽约的时间
print("纽约: \(newYork)")

let london = getDate(date: now)  ////获取当前伦敦的时间
print("伦敦: \(london)")
/*
 2.    处理字符串
 a)    新建字符串：“Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS.”；
 b)    返回字符串从第6个字符到第20个字符的子串；
 c)    删除其中所有的OS字符；
 */
var str="Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS."

let startIndex=str.index(str.startIndex,offsetBy: 5)
let endIndex=str.index(str.startIndex,offsetBy:19)
var str2=str[startIndex...endIndex]
print(str2)
var str3=str.replacingOccurrences(of: "OS", with: "")
print(str3)
/*
 3.    将1、2题的时间和字符串存入一个字典中，并存入沙盒中的Document某文件中；
 */
var dictionary = [["时间":beijing,"字符串":str],["时间":tokyo,"字符串":str2],["时间":newYork,"字符串":str3]]as AnyObject
let fileManager=FileManager.default
if var docPath=fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
{
    docPath.appendPathComponent("test")
    dictionary.write(toFile:docPath.path,atomically:true)
    print(docPath.path)
    let kk=NSDictionary(contentsOf: docPath)
    print(kk as Any)
}
/*
 4.    从网上下载一张照片并保存到本地沙盒的Document的某文件中；
 */
let imageUrl=URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1538060490247&di=5c1426f416827e7515a18d1efca4413b&imgtype=0&src=http%3A%2F%2Fpic63.nipic.com%2Ffile%2F20150330%2F8993928_082652755616_2.jpg")!
let imageDate=try! Data(contentsOf: imageUrl)
let image=UIImage(data:imageDate)
var imageLocalUrl=fileManager.urls(for: .documentDirectory, in:.userDomainMask).first!
imageLocalUrl.appendPathComponent("1.jpg")
try?imageDate.write(to: imageLocalUrl)
/*
 5.    从网上查找访问一个JSon接口文件，并采用JSONSerialization和字典对其进行简单解析；
 */
let weatherUrl=URL(string: "http://www.weather.com.cn/data/cityinfo/101010100.html")!
let weatherDate=try!Data(contentsOf: weatherUrl)
let jsonObject=try!JSONSerialization.jsonObject(with: weatherDate, options: .allowFragments)
if let dic = jsonObject as? [String:Any]
{
    if let weatherDic = dic["weatherinfo"] as? [String:String]
    {
        print(weatherDic["temp1"]!)
        print(weatherDic["weather"]!)
    }
    
}

extension Int {
    
    func sqrt() -> Double {
        return Darwin.sqrt(Double(self))
    }
}

