//
//  ViewController.swift
//  1223test
//
//  Created by ZBin on 15/12/23.
//  Copyright © 2015年 ZBin. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        //带参数，也带结果处理

//        Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["foo": "bar"])
//            .responseString { (Response) -> Void in
//                print("ssssssssss\(Response.result.value)")
//        }
        
        //使用POST请求时，参数是在HTTP BODY 里面传递，url上看不到
//        let parameters = [
//            "foo": "bar",
//            "baz": ["a", 1],
//            "qux": [
//                "x": 1,
//                "y": 2,
//                "z": 3
//            ]
//        ]
//        
//        let request = Alamofire.request(.POST, "https://httpbin.org/post", parameters: parameters, encoding: .URL, headers: nil)
//        
//        debugPrint("\(request)")
        
        
//        //判断数据请求是否成功，并作出相应处理
//        let aaa = Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["foo": "bar"]).responseJSON { response in
//                switch response.result {
//                case .Success:
//                    print("数据获取成功!")
//                case .Failure(let error):
//                    print(error)
//                }
//        }
//        debugPrint("\(aaa)")
        
        
        
        //使用alamofire进行文件上传
        
 
     
        let fireurl = NSBundle.mainBundle().URLForResource("hangge", withExtension: "zip")
        
        Alamofire.upload(.POST, "http://www.hangge.com/upload.php",  file: fireurl!)
        //带上传进度
        Alamofire.upload(.POST, "http://www.hangge.com/upload.php",  file: fireurl!).progress { (byteswritten, totalbyteswritten, totalbytesExpectedToWrite) -> Void in
            
            let progressView:UIProgressView
            
            progressView = UIProgressView(progressViewStyle: .Default)
            
            progressView.progress = 0.0
            
            progressView.tintColor = UIColor.blueColor()
            
            progressView.trackTintColor = UIColor.blueColor()
            
            self.view.addSubview(progressView)
            
            progressView.setProgress(Float(totalbyteswritten / totalbytesExpectedToWrite), animated: true)
       
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
            })
           
        }
        
    }

    //TODO: get请求不带参数
    
    func getNoparamatter(){
        Alamofire.request(.GET, "http://www.baidu.com")
    }
    //TODO: get带参数，不带处理结果
    
    func getHaveparamatter(){
        Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["foo" : "bar"])
    }
        
        
}


