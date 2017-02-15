//
//  LoginService.swift
//  ShengJianBao
//
//  Created by welsonla on 16/1/25.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit
import ObjectMapper

class LoginService: NetworkEngine {
    
    //注册
    func register(regModel:MTRegister,respon:FireResultResponse){
        var params = Dictionary<String,String>()
        params["userName"] = regModel.user
        params["role"] = "3"
        params["tel"] = regModel.mobile
        params["smsVerify"] = regModel.code
        params["password"] = regModel.pass
        
        self.Post("/sysuser/registerUserPhone", params: params, respClosure: { (result, data, error) -> Void in
            // JSON to Model
            if(result){
                
            }
            
            respon(result: result, data: data, error: error)
        }) { (error) -> Void in
            
        }
    }
    
    func login(name:String,pass:String,respon:FireResultResponse){
        let params = ["phone":"1","role":"3","tel":name,"password":pass]
        self.Post("/sys/sysuser/frontlogin", params: params, respClosure: { (result, data, error) -> Void in
            if result == true{
                //JSON to Model
                let user = Mapper<MTUser>().map(data!["entity"])
                print("username:\(user?.userName)")
                let userdata = user?.toJSONString()
                NSUserDefaults.standardUserDefaults().setObject(user?.userCode, forKey: "token")
                NSUserDefaults.standardUserDefaults().setObject(userdata, forKey: "user")
                
                print("user is \(userdata)")
            }
            respon(result: result, data: data, error: error)
        }) { (error) -> Void in
            
        }
    }
    
    
    //发送验证码
    func getMobileCode(mobile:String,respon:FireResultResponse){
        let params = ["tel":mobile,"role":"3"]
        self.Post("/sysuser/registerverifyphone", params: params, respClosure: { (result, data, error) -> Void in
            respon(result: result, data: data, error: error)
        }) { (error) -> Void in
                
        }
    }
    
    //发送验证码
    func getResetMobileCode(mobile:String,respon:FireResultResponse){
        let params = ["tel":mobile,"role":"3","Type":"1"]
        self.Post("/sysuser/registerverifyphone", params: params, respClosure: { (result, data, error) -> Void in
            respon(result: result, data: data, error: error)
            }) { (error) -> Void in
                
        }
    }
}
