//
//  UserInfoService.swift
//  ShengJianBao
//
//  Created by Mike on 16/3/27.
//  Copyright © 2016年 hyz. All rights reserved.
//
import ObjectMapper

class UserInfoService: NetworkEngine {
    func getUserInfo(userCode:String,respon:FireResultResponse) {
        let postData = ["user":userCode]
        self.Post("/sys/sysuser/getUserByCode", params:postData , respClosure: { (result, data, error) in
            
            respon(result: result, data: data, error: error)
            
            }) { (error) in
                
        }
    }
    
    func getUserNotify(userCode:String,start:String,limit:String,respon:FireResultResponse){
        let postData = ["user":userCode,"start":start,"limit":limit,"sort":"[{\"property\":\"dateAdd\",\"direction\":\"DESC\"}]"]
        self.Post("/other/usermessage/getUserMessageList", params:postData , respClosure: { (result, data, error) in
            
            
            let dict = data as! Dictionary<String,AnyObject>
            
           let dataArray = Mapper<GetUserMessageListIndex>().map(dict)
            
            respon(result: result, data: dataArray, error: error)
            
        }) { (error) in
            
        }
    }
    
    
    func getShengYaData(userCode:String,respon:FireResultResponse){
        let postData = ["user":userCode]
        self.Post("/user/growup/getEntityByCode", params:postData , respClosure: { (result, data, error) in
            let dict = data as! Dictionary<String,AnyObject>
            respon(result: result, data: dict, error: error)
        }) { (error) in
            
        }
    }
    
    func getAbout(respon:FireResultResponse){
        
        self.Post("/other/about/getAbout", params:[:] , respClosure: { (result, data, error) in
            
            respon(result: result, data: data, error: error)
            
        }) { (error) in
            
        }
    }
}
