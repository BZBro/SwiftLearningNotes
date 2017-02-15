//
//  NetworkEngine.swift
//  ShengJianBao
//
//  Created by Mike on 16/1/24.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

typealias FireResponse = (data:AnyObject?,error:NSError?)->Void
typealias FireError = (error:NSError)->Void
typealias FireResultResponse = (result:Bool,data:AnyObject?,error:NSError?)->Void

struct ShengJianURL {
//    static let baseUrlString = "http://mszp.365dol.com"
//    static let p0 = "/recruit"
//    static let p1 = "/recruit"
    
//    static let findIndexApply = "/recruit/RecruitInfo/findIndexApply"
//    static let apiDomain = "http://www.shengjianbao.cc/sys"
    static let domain = "http://www.shengjianbao.cc"
    
}

class NetworkEngine: NSObject {
    
    static internal func request(
        method: Alamofire.Method,
        _ URLString: URLStringConvertible,
        parameters: [String: AnyObject]? = nil,
        encoding: ParameterEncoding = .URL,
        headers: [String: String]? = nil)
        -> Request
    {
        
//        let _url = ShengJianURL.baseUrlString + ShengJianURL.p0 + ShengJianURL.p1 + URLString.URLString
        let _url = ShengJianURL.domain+URLString.URLString
        //计算token
        
        return Manager.sharedInstance.request(
            method,
            _url,
            parameters: parameters,
            encoding: encoding,
            headers: headers
        )
    }
    
    static internal func GET( URLString: URLStringConvertible,
        parameters: [String: AnyObject]? = nil,
        encoding: ParameterEncoding = .URL,
        headers: [String: String]? = nil)
        -> Request
    {
        return request(Method.GET,URLString,parameters: parameters,encoding: encoding,headers: headers)
    }
    
    static internal func POST( URLString: URLStringConvertible,
        parameters: [String: AnyObject]? = nil,
        encoding: ParameterEncoding = .URL,
        headers: [String: String]? = nil)
        -> Request
    {
        return request(Method.POST, URLString,parameters: parameters,encoding: encoding,headers: headers)
    }
    
    
    //时间戳
    static internal func Timestamp() -> String{
        //1453132959
        let seconds = NSDate().timeIntervalSince1970
        return "\(Int(ceil(seconds)))"
    }
    
    //时区时间
    static internal func TimeZoneTime() -> String{
        let date = NSDate()
        
        let formatter = NSDateFormatter.init()
        
        //Tue 19 Jan 2016 00:00:53 GMT+8
        formatter.dateFormat = "EEE dd MMM yyyy HH::mm:ss zzz"
        let stringOfDate = formatter.stringFromDate(date)
        return stringOfDate
    }
    
    //公共的Get基类方法
    func Get(route:String, respClosure: FireResultResponse, failClosure: FireError){
        let url = ShengJianURL.domain + route
        
        Alamofire.request(.GET, url).responseJSON { (respon) -> Void in
            
            let JSON = respon.result.value
            let error = respon.result.error
            
            print("JSON for response:\(JSON)")
            print("Error \(respon.result.error?.description)")
            
            var resultCode:Bool = false
            
            print("JSON for response:\(JSON)---result:\(resultCode)")
            print("Error \(respon.result.error?.description)")
            
            resultCode = (JSON!["success"] as? Bool)!
            
            respClosure(result: resultCode, data: JSON, error: error)
            
//            let JSON = respon.result.value
//            let error = respon.result.error
//            
//            if error == nil{
//                respClosure(data: JSON!, error: error)
//            }else{
//                failClosure(error: error!)
//            }
        }
    }
    
    //公共的Post基类方法
    func Post(route:String, params:Dictionary<String,String>,respClosure:FireResultResponse,failClosure:FireError){
        let url = ShengJianURL.domain + route
        Alamofire.request(.POST, url, parameters: params, encoding: .URL, headers: nil).responseJSON { (respon) -> Void in
            
            let JSON = respon.result.value
            let error = respon.result.error
            var resultCode:Bool =  false
            
            print("JSON for response-----:\(JSON)---result:\(resultCode)")
            print("Error \(respon.result.error?.description)")
            
            if error != nil{
                return
            }
            
            //有可能没有success字段
            if let success = JSON!["success"] as? Bool {
                 resultCode = success
            }
           
            
            respClosure(result: resultCode, data: JSON, error: error)
        }
    }

}
