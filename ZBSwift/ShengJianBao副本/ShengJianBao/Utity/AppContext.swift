//
//  AppContext.swift
//  ShengJianBao
//
//  Created by welsonla on 16/1/28.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit
import ObjectMapper

let WorkTypeDaily = 10
let WorkTypeFinish = 20
class AppContext: NSObject {
    
    static let shareInstance = AppContext()
    var userHolder:MTUser?
    
    private override init() {}
    
    //检查登录状态
    static internal func isLogin() ->Bool{
        if NSUserDefaults.standardUserDefaults().objectForKey("token") != nil {
            return true
        }
        
        return false
    }
    
    static internal func saveToken(token:String!){
        NSUserDefaults.standardUserDefaults().setObject(token, forKey: "token")
    }
    
    static internal func getToken() ->String{
        return NSUserDefaults.standardUserDefaults().objectForKey("token") as! String
    }
    
    //登出，清空本地用户信息
    static internal func logout(){
        NSUserDefaults.standardUserDefaults().removeObjectForKey("token")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("user_name")
        NSUserDefaults.standardUserDefaults().removeObjectForKey("user_pwd")

    }
    
    static internal func saveUserLoginInfo(userName:String,userPwd:String){
        NSUserDefaults.standardUserDefaults().setObject(userName,forKey:"user_name")
        NSUserDefaults.standardUserDefaults().setObject(userPwd,forKey:"user_pwd")
    }
    
    static internal func getUserLoginInfo() ->Dictionary<String,String>?{
        if (NSUserDefaults.standardUserDefaults().objectForKey("user_name") != nil
            && NSUserDefaults.standardUserDefaults().objectForKey("user_pwd") != nil){
            let user_name:String = NSUserDefaults.standardUserDefaults().objectForKey("user_name") as! String
            let user_pwd:String = NSUserDefaults.standardUserDefaults().objectForKey("user_pwd") as! String
            return ["user_name":user_name,"user_pwd":user_pwd]
        }
        
        return nil
    }

    
    //获取用户信息
    static internal func user()->MTUser?{
        
        if let aUser = AppContext.shareInstance.userHolder {
            return aUser;
        }else{
            let jsonString = NSUserDefaults.standardUserDefaults().objectForKey("user") as? String
            if jsonString != nil {
                let userObject = Mapper<MTUser>().map(jsonString!)
                
                let user_info = AppContext.getUserLoginInfo()
                
                if user_info != nil {
                    LoginService().login(user_info!["user_name"]!, pass: user_info!["user_pwd"]!, respon: { (result, data, error) in
                        //更新user对象
                        let user = Mapper<MTUser>().map(data!["entity"])
                        AppContext.shareInstance.userHolder = user
                    })
                }
                AppContext.shareInstance.userHolder = userObject
                return userObject!;
            }
            return nil
        }

    }
    
    static internal func showLogin(superVC:UIViewController){
        let loginNav = UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController()
        superVC.presentViewController(loginNav!, animated: true) { () -> Void in
            
        }
    }
    
    static internal func showNetError(superVC:UIViewController){
        let clubNav = UIStoryboard(name: "Club", bundle: nil).instantiateViewControllerWithIdentifier("NetErrorVC")
        superVC.navigationController?.pushViewController(clubNav, animated: true)
    }
    
    static internal func pushDataNull(superVC:UIViewController){
        let clubNav = UIStoryboard(name: "Club", bundle: nil).instantiateViewControllerWithIdentifier("DataNullVC")
        superVC.navigationController?.pushViewController(clubNav, animated: true)
    }
    
    
    static internal func addNetError(superVC:UIViewController){
        let clubNav = UIStoryboard(name: "Club", bundle: nil).instantiateViewControllerWithIdentifier("NetErrorVC")
        superVC.view.addSubview(clubNav.view)
    }
    
    static internal func isReachability () -> Bool {
        let reachability = Reachability.reachabilityForInternetConnection()
        
        var reach:Bool
        
        if reachability!.isReachable(){
            reach = true
        }else{
            reach = false
        }
        return reach
    }
    
}
