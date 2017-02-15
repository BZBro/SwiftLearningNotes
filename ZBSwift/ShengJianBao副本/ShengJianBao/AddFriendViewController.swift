//
//  AddFriendViewController.swift
//  ShengJianBao
//
//  Created by Mike on 16/1/20.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit
import SwiftyJSON
class AddFriendViewController: UIViewController {

    var code = String()
    
    @IBOutlet weak var nickName: UILabel!
    
    @IBOutlet weak var creditValueView: UIView!
    
    @IBOutlet weak var sexImage: UIImageView!
    
    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var creditHeart: UIImageView!
    
    @IBOutlet weak var creditValueLabel: UILabel!
    //验证消息
    @IBOutlet weak var authenticationTextView: UITextView!
    
    @IBAction func addFriendbuttonT(sender: UIButton) {
        
        //获取userCode
        let MTUserInfo:MTUser! = AppContext.user()
        //我的
        let usercode = MTUserInfo.userCode
        
        let authenString = self.authenticationTextView.text as NSString
        
        if authenString.length == 0 {
            
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.labelText = "认证消息不能为空"
            hud.mode = .Text
            hud.opacity = 0.5
            hud.hide(true, afterDelay: 0.8)
            
        }else{
            
            print("-------->",usercode!)
            print(code)
            NetworkEngine.POST("/friend/UserAddVerify/saveUserAddVerify", parameters: ["cmd":"new","userCodeTo":"\(code)","user":"\(usercode!)","content":"\(authenString)"]).responseJSON { (response) -> Void in
                print("---------->value",response.result.value)
                let json = JSON(data: response.data!)
                let message = json["message"].stringValue
                let success = json["success"].int
                if success == 1 {
                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                    hud.labelText = message
                    hud.mode = .Text
                    hud.opacity = 0.5
                    hud.hide(true, afterDelay: 0.8)
                }else{
                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                    hud.labelText = message
                    hud.mode = .Text
                    hud.opacity = 0.5
                    hud.hide(true, afterDelay: 0.8)
                }
            }
        }
        
//        /friend/UserAddVerify/saveUserAddVerify
//        
//        提交方式
//        POST
//        
//        传入参数
//            {
//                cmd:’new’,//代表新增
//                userCodeTo:’1111111’,//要添加的用户编号
//                user:’f13acfaf9b984bbdb7807128e3f4b118’,//当前登录用户编号
//                content：’验证信息’//验证信息
//        }
//        
//        返回参数
//            {
//                success：true/false 成功/失败
//        }
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "添加好友"
     
        
        
//        路径
//        /sys/sysuser/getUserByCodeInfo
//        
//        提交方式
//        POST
//        
//        传入参数
//            {
//                userCode:’802bf9d64ea743b4934c8ecd2b4a184f’//用户编号
//        }
//        
//        返回参数
//            {
//                userPhoto：用户头像
//                schoolTime：入学时间
//                realName：用户真实姓名
//                userCredit：用户信用值
//        }
        
        
    }
    
    func getCode(addNotification:NSNotification){
        self.code = addNotification.object?.valueForKey("addcode") as! String
        
        print(code)
        
        //获取userCode
        let MTUserInfo:MTUser! = AppContext.user()
        //我的
        let usercode = MTUserInfo.userCode
        
        let queue:dispatch_queue_t = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        dispatch_async(queue) { () -> Void in
            
            NetworkEngine.POST("/sys/sysuser/getUserByCodeInfo", parameters:["userCode":"\(usercode)"]).responseJSON(completionHandler: { (response) -> Void in
                print("获取要添加认得信息---->",response.result.value)
                //
                let json = JSON(data: response.data!)
                let jsonuserPhoto = json["userPhoto"].stringValue
                if jsonuserPhoto == "" {
                    self.avatar.image = UIImage(named: "包子头")
                }else{
                    let imageString = "http://www.shengjianbao.cc" + jsonuserPhoto
                    let imageUrl:NSURL = NSURL(string: imageString)!
                    print("------------>",self.avatar)
                    self.avatar.sd_setImageWithURL(imageUrl)
                }
                //
                
                if json["realName"].stringValue == "" {
                    self.nickName.text = json["userName"].stringValue
                }
                if json["userCredit"] != nil {
                      self.creditValueLabel.text = "信 用 值:" + String(json["userCredit"].int!)
                }else{
                    self.creditValueLabel.text = "信 用 值:" + "无返回值"
                }
                
                
                if json["userCredit"].int == 0 {
                    self.sexImage.image = UIImage(named: "女")
                }else{
                    self.sexImage.image = UIImage(named: "男")
                }
            })
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.view.setNeedsDisplay()
            })
        }

    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillAppear(true)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
