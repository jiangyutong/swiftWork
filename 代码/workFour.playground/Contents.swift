import UIKit
import PlaygroundSupport


/*
 1.    文件缓存处理：
 a)    判断沙盒的Document目录下是否存在某文件夹，如果没有则新建一个该文件夹；
 b)    判断是否该文件夹下存在一个图片文件，如果存在该文件，读取该文件到一个图片对象中并进行显示，如果不存在则从网上下载一张图片并保存到该图片文件中。
 
 */
let fileManager=FileManager.default
if var docPath=fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
{
    
    docPath.appendPathComponent("3.jpg")
    
    if !fileManager.fileExists(atPath: docPath.path)
    {
        let imageUrl=URL(string: "http://img.zcool.cn/community/01f09e577b85450000012e7e182cf0.jpg@1280w_1l_2o_100sh.jpg")
        let imageData=try Data(contentsOf: imageUrl!)
        var image=UIImage(data: imageData)
        docPath.appendPathComponent("3.jpg")
        try imageData.write(to:docPath)
        
        
    }
    else
    {
        let imageData=try Data(contentsOf: docPath)
        var image=UIImage(data: imageData)
    }
}
/*
 2.    自定制视图：
 a)    从UIView中派生一个自定制的View；
 b)    绘制一个椭圆（或则自己喜欢的任何图形）；
 c)    新建视图对象并进行显示；
 
 */

//做的是一个可以顺时针旋转的圆圈和一个椭圆

/*
 2.    自定制视图：
 a)    从UIView中派生一个自定制的View；
 b)    绘制一个椭圆（或则自己喜欢的任何图形）；
 c)    新建视图对象并进行显示；
 
 */
class Ellipse:UIView
{
    override func draw(_ rect: CGRect) {
        let aPath = UIBezierPath(ovalIn: CGRect(x: 10, y: 10, width: 200, height: 300))
        
        UIColor.blue.setFill()
    }
    
}
class MyView:UIView
{
    var beginAngle = Double.pi*3/2 // 起点
    var finishAngle = Double.pi*3/2+Double.pi*2/20 // 终点
    
    override func draw(_ rect: CGRect) {
        
        
        let aPath = UIBezierPath(arcCenter:CGPoint(x: 150, y: 150), radius: 75, startAngle: (CGFloat)(beginAngle), endAngle: (CGFloat)(finishAngle), clockwise: true)
        aPath.addLine(to:CGPoint(x: 150, y: 150))
        aPath.close()
        aPath.lineWidth = 5.0
        UIColor.red.setFill()
        aPath.fill()
        
        finishAngle += Double.pi/20
        
    }
}

class Controller:UIViewController
{
    
    var lable:UILabel!
    var timer: Timer?// 计时器
    var myView=MyView(frame: CGRect(x: 100, y: 600, width: 300, height: 300))
    var myEllipse=Ellipse()
    
    @objc func reDrawView() {
        myView.setNeedsDisplay() // 重绘界面
        // 画完一圈后停止
        if myView.finishAngle > myView.beginAngle+Double.pi*2 {
            timer?.invalidate() // 停止计时器
        }
    }
    @IBAction func click()
    {
        print("jakds")
        lable.text="i am click"
    }
    override func loadView() {
        let view=UIView(frame:CGRect(x: 0, y: 0, width: 900, height: 900))
        view.backgroundColor=UIColor.red
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self,
                                     selector:#selector(reDrawView), userInfo: nil, repeats: true)
        view.addSubview(myView)
        view.addSubview(myEllipse)
    }
    
}

let tc=Controller()
PlaygroundPage.current.liveView=tc

