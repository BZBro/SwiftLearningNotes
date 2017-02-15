//
//  DetailViewController.swift
//  NoWait
//
//  Created by Admin on 15/9/17.
//  Copyright © 2015年 ZhangBin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,WXApiDelegate {

    var detailURL:NSString?
    
    var myID:NSNumber?
    
 
    @IBAction func sendToFriend(sender: AnyObject) {
        //self.sendText()
        print("发送朋友")
        
    }
    @IBAction func sendTOTimeline(sender: AnyObject) {
        //self.sendWXContentFriend()
        print("发送到朋友圈")
    }
//    func sendText(){
//        let req = SendMessageToWXReq()
//        req.scene = Int32(WXSceneSession.rawValue)
//        req.text = "文本标题"
//        req.bText = true
//        WXApi.sendReq(req)
//        
//    }

//    func sendWXContentFriend() {
//        //分享朋友圈
//        let message:WXMediaMessage = WXMediaMessage()
//
//        message.setThumbImage(UIImage(named: "title"));
//        let ext:WXWebpageObject = WXWebpageObject();
//        message.mediaObject = ext
//        message.mediaTagName = "摄影"
//        let req = SendMessageToWXReq()
//        req.scene = 1
//        req.text = "分享图片："
//        req.bText = true
//        req.message = message
//        WXApi.sendReq(req);
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\(detailURL)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func returnFirstPage(){
        performSegueWithIdentifier("ToReturnMainVC", sender: nil)
    }

    

}
