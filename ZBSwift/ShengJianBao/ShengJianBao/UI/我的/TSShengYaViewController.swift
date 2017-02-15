//
//  TSShengYaViewController.swift
//  ShengJianBao
//
//  Created by Mike on 16/4/3.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class TSShengYaViewController: UIViewController {
    @IBOutlet weak var avatarImgView: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        fetchData((AppContext.user()?.userCode)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func fetchData(userCode:String){
        UserInfoService().getShengYaData(userCode) { (result, data, error) in
            let dict = data as! Dictionary<String,AnyObject>
            self.fillData(dict)
        }
    }
    
    func fillData(dict1:Dictionary<String,AnyObject>) {
        /*
         dateApply = "<null>";
         dateBank = "<null>";
         dateExam = "<null>";
         dateInfoPerfect = "<null>";
         datePost = "<null>";
         dateRecharge = "<null>";
         dateRegister = "2016-03-26 15:04:04";
         dateVerify = "<null>";
         dateWork = "<null>";
         */
        
        var dict = dict1
        
        let sortKeys = ["dateApply","dateBank",
                        "dateExam","dateInfoPerfect",
                        "datePost","dateRecharge",
                        "dateRegister","dateVerify",
                        "dateWork"]
        
        dict["dateApply"] = "2016-03-27 15:04:04"
        
        dict["dateRecharge"] = "2016-03-22 15:04:04"
        
        dict["dateVerify"] = "2016-03-21 15:04:04"

        
        let timeLine = NSMutableArray()
        
        for sortKey in sortKeys{
            let sortValue = dict[sortKey]
            
            if let strValue = sortValue as? String {
                
               let formatter = NSDateFormatter()
                formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                
                let dateValue = formatter.dateFromString(strValue)
                
                if let date = dateValue{
                    timeLine.addObject(["title":sortKey,"date":date])
                }
            }
            
        }
        
        let timeLineSorted =  timeLine.sort { (p1, p2) -> Bool in
            let d1 = p1["date"] as! NSDate
            let d2 = p2["date"] as! NSDate
            
            if d1.compare(d2) == NSComparisonResult.OrderedDescending{
                return true
            }
            return false
        }
        
        
        dispatch_async(dispatch_get_main_queue()) { 
            self.render(timeLineSorted )
        }
        
        print(timeLineSorted)
        
    }
    
    
    
    func render(timeLineSorted:AnyObject){
        
        let iconMap = ["dateApply":"笔记",
                       "dateBank":"笔记",
                       "dateExam":"笔记",
                       "dateInfoPerfect":"笔记",
                       "datePost":"笔记",
                       "dateRecharge":"笔记",
                       "dateRegister":"笔记",
                       "dateVerify":"笔记",
                       "dateWork":"笔记"]
        
        let titleMap = ["dateApply":"首次订阅时间",
                       "dateBank":"被注销",
                       "dateExam":"做题",
                       "dateInfoPerfect":"第一次完善资料",
                       "datePost":"首次发帖时间",
                       "dateRecharge":"笔记",
                       "dateRegister":"注册时间",
                       "dateVerify":"笔记",
                       "dateWork":"首次完成工作时间"]
        
        
        if let timeLine = timeLineSorted as? Array<Dictionary<String,AnyObject>>{
            var Y:CGFloat = CGRectGetMaxY(self.avatarImgView.frame)+20.0
            var indexTimeItem = 0
            
            let split = 3
            
            var loopCount = timeLine.count / split
            
            if timeLine.count % split != 0{
                loopCount = loopCount + 1
            }
            loopCount = loopCount + timeLine.count
            
            var viewList = [UIView]()
            
            var preView:UIView?
            
            for index in 0...loopCount{
                if index%split == 0 {
                    let image = UIImageView(frame: CGRectMake(0, 0, 15, 14))
                    image.image = UIImage(named: "黄点")
                    
                    image.center = CGPointMake(CGRectGetWidth(self.view.frame)/2, Y)
                    
                    self.view.addSubview(image)
                    viewList.append(image)
                    
                    if preView != nil {
                        
                        var center = preView?.center
                        
                        let y = (CGRectGetMinY(image.frame)-CGRectGetMaxY(preView!.frame))/2+CGRectGetMaxY(preView!.frame)
                        center?.y = y
                        
                        let v = UIView(frame: CGRectZero)
                        
                        v.frame = CGRectMake(0, 0, 2, CGRectGetMinY(image.frame)-CGRectGetMaxY(preView!.frame)+6)
                        v.center = center!
                        v.backgroundColor = UIColor(red: 248/255.0, green: 216/255.0, blue: 6/255.0, alpha: 1)
                        self.view.addSubview(v)
                        
                    }
                    preView = image;
                    Y = Y + 50
                }else{
                    let timeTitle = timeLine[indexTimeItem]["title"] as! String
                    let dateValue = timeLine[indexTimeItem]["date"] as! NSDate
                    
                    let formatter = NSDateFormatter()
                    formatter.dateFormat = "yyyy-MM-dd"
                    
                    let dateStr = formatter.stringFromDate(dateValue)
                    
                    let image = UIImageView(frame: CGRectMake(0, 0, 21, 21))
                    image.image = UIImage(named: iconMap[timeTitle]!)
                    
                    image.center = CGPointMake(CGRectGetWidth(self.view.frame)/2, Y)
                    
                    
                    let leftLabelView:UILabel = UILabel(frame: CGRectZero)
                    let rightLabelView:UILabel = UILabel(frame: CGRectZero)
                    
                    var leftStr = NSString()
                    var rightStr = NSString()
                    
                    let font = UIFont.systemFontOfSize(14)
                    
                    let titleStr = titleMap[timeTitle]! as NSString
                    

                    if indexTimeItem%2 == 1 {
                        leftStr = dateStr as NSString
                        rightStr = titleStr
                    }else{
                        leftStr = titleStr
                        rightStr = dateStr as NSString
                    }
                    
                    var size = leftStr.sizeWithAttributes([NSFontAttributeName:font])

                    var frame = CGRectZero
                    
                    frame.size = size
                    
                    frame.origin.y = image.frame.origin.y
                    
                    var x = CGRectGetMinX(image.frame) - 20 - size.width
                    
                    frame.origin.x = x
                    
                    leftLabelView.font = font
                    leftLabelView.text = leftStr as String
                    leftLabelView.frame = frame
                    
                    //left end
                    
                    size = rightStr.sizeWithAttributes([NSFontAttributeName:font])
                    
                    frame = CGRectZero
                    
                    frame.size = size
                    
                    frame.origin.y = image.frame.origin.y
                    
                    x = CGRectGetMaxX(image.frame) + 20
                    
                    frame.origin.x = x
                    
                    rightLabelView.font = font
                    rightLabelView.text = rightStr as String
                    rightLabelView.frame = frame
                    
//                    if indexTimeItem%2 == 1 {
//
//                       let x = CGRectGetMinX(image.frame) - 20 - size.width
//                        
//                        frame.origin.x = x
//                        
//                        
//                    }else{
//                       let x = CGRectGetMaxX(image.frame) + 20
//                       frame.origin.x = x
//                    }
                    

                    
                    self.view.addSubview(image)
                    self.view.addSubview(leftLabelView)
                    self.view.addSubview(rightLabelView)

                    
                    viewList.append(image)
                    Y = Y + 50
                    indexTimeItem = indexTimeItem + 1
                    
                    var center = preView?.center
                    
                    let y = (CGRectGetMinY(image.frame)-CGRectGetMaxY(preView!.frame))/2+CGRectGetMaxY(preView!.frame)
                    center?.y = y
                    
                    let v = UIView(frame: CGRectZero)
                    
                    v.frame = CGRectMake(0, 0, 2, CGRectGetMinY(image.frame)-CGRectGetMaxY(preView!.frame)+6)
                    v.center = center!
                    v.backgroundColor = UIColor(red: 248/255.0, green: 216/255.0, blue: 6/255.0, alpha: 1)
                    self.view.addSubview(v)
                    
                    
                    preView = image;
                }

            }
            
            
            
            
            
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
