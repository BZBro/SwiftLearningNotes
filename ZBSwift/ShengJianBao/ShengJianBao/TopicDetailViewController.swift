//
//  TopicDetailViewController.swift
//  ShengJianBao
//
//  Created by Mike on 16/1/20.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import SwiftyJSON
import IQKeyboardManagerSwift
class TopicDetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextViewDelegate{

    @IBOutlet weak var NullDataView: UIView!
    //当前话题的编号
    var code:String?

    var pSelectedRow = String()
    
    var clublistArray = [MTClubApply]()
    
    var commentlistArray = [MTClubApply]()

    
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var textviewBottomConstraint: NSLayoutConstraint!//底部回复view的constraint
    
    @IBOutlet weak var replyTextFiled: UITextView!//回复的textview
    
    @IBOutlet weak var replyButton: UIButton!//回复  按钮
    
    @IBOutlet weak var replyView: UIView!//底部放置 回复  按钮 和 replyTextFiled的view
    
    @IBAction func replyButtonT(sender: UIButton) {
        
       
        
        /**

        路径
        /info/goodscomment/saveReplyComment
        
        提交方式
        POST
        
        传入参数
        {
        user:’385c68cabd5d465a8f23617b4a29f38b’, //当前登录用户编号
        code:’5dbd99fd66b847f4a24ea51c1a3db45c’,//话题编号
        commentCode:’’,//评论编号
        replyCode:’f13acfaf9b984bbdb7807128e3f4b118’,//回复对象用户编号
        commentContent:’’ //回复内容
        }
        
        返回参数
        {
        praiseNum：点赞数量
        shareNum：分享数量
        evaluateNum：评论数量
        }


         */
        
        if (self.replyTextFiled.text as NSString).length == 0{
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.labelText = "回复消息不能为空"
            hud.mode = .Text
            hud.opacity = 0.5
            hud.hide(true, afterDelay: 0.8)
        }else{
            let queue:dispatch_queue_t = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
            dispatch_async(queue) { () -> Void in

                let usercode = AppContext.user()?.userCode!
                
                NetworkEngine.POST("/info/goodscomment/saveReplyComment", parameters:["user":"\(usercode)","code":"\(self.code!)","commentContent":"\(self.replyTextFiled.text)"]).responseJSON(completionHandler: { (response) -> Void in
                    print("返回当前的回复结果--->",response.result.value)
                    
                    if response.result.value != nil {
                        let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                        hud.labelText = "回复成功"
                        hud.mode = .Text
                        hud.opacity = 0.5
                        hud.hide(true, afterDelay: 0.8)
                    }else{
                        let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                        hud.labelText = "回复失败"
                        hud.mode = .Text
                        hud.opacity = 0.5
                        hud.hide(true, afterDelay: 0.8)
                        self.getPost()
                    }
                    
                })
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.replyTextFiled.text = nil
                    self.view.setNeedsDisplay()
                })
            }
        }
        
        
//        self.replyTextFiled.resignFirstResponder()
//        textviewBottomConstraint.constant = 0
//        replyTextFiled.frame = tempreplyTextFrame
//        replyView.frame = tempreplyViewFrame
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let topView :CYPullRefreshSimpleTopView = CYPullRefreshSimpleTopView()
        
        self.tableview.cy_addPullDownHanlder({ () -> Void in
            
            self.clublistArray.removeAll()
            self.getPost()
            
            }, topView: topView)
        
        self.replyView.backgroundColor = UIColor.blueColor()
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWasShown:", name: UIKeyboardDidShowNotification, object: nil
        )
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillBeHidden:", name: UIKeyboardDidHideNotification, object: nil
        )
        
        replyTextFiled.autoresizingMask = .None
        replyView.autoresizingMask = .None
        replyTextFiled.returnKeyType = .Next
        replyTextFiled.layer.cornerRadius = 5
        replyTextFiled.layer.borderColor = UIColor.grayColor().CGColor
        replyTextFiled.layer.borderWidth = 0.5
        replyButton.layer.cornerRadius = 5
        replyTextFiled.delegate = self
        //replyTextFiled.layer.masksToBounds = true;
        self.getPost()
    }
    
    func getPost(){
        let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        hud.labelText = "加载中"
        hud.mode = .Indeterminate
        hud.opacity = 0.5
        let workingQueue = dispatch_queue_create("my_queue", nil)
        // 派发到刚创建的队列中，GCD 会负责进行线程调度
        dispatch_async(workingQueue) {
            // 在 workingQueue 中异步进行
            if let row = Int(self.pSelectedRow){
                self.getListDetail(row + 1)
                NSThread.sleepForTimeInterval(1)
            }
            if self.clublistArray.count == 0 {
                
            }
            else{
                dispatch_async(dispatch_get_main_queue()) {
                    // 返回到主线程更新 UI
                    hud.hide(true)
                    self.tableview.reloadData()
                }
            }
        }
    }
    
    //
    func keyboardWasShown(keyBoardNoti:NSNotification){
//        print(keyBoardNoti.userInfo)
//        let kbSize = (keyBoardNoti.userInfo!) as NSDictionary
//        let kbFrame = kbSize.objectForKey(UIKeyboardFrameEndUserInfoKey)?.CGRectValue
//        UIView.animateWithDuration(0.25) { () -> Void in
//            self.replyView.frame.origin.y = (self.replyView.frame.origin.y - (kbFrame?.height)!)
//
//        }
    }
    
    func keyboardWillBeHidden(keyBoardNoti:NSNotification){
//        print(keyBoardNoti.userInfo)
//        let kbSize = (keyBoardNoti.userInfo!) as NSDictionary
//        let kbFrame = kbSize.objectForKey(UIKeyboardFrameEndUserInfoKey)?.CGRectValue
//        UIView.animateWithDuration(0.25) { () -> Void in
//            self.replyView.frame.origin.y = (self.replyView.frame.origin.y + (kbFrame?.height)!)
//            
//        }
    }
    
    func getCode(codestringNoti:NSNotification){
        code = (codestringNoti.object?.valueForKey("codename") as! String?)!
        pSelectedRow = (codestringNoti.object?.valueForKey("cellnum")) as! String
        
    }
    
    //
    func getListDetail(listNum:Int){
       
        NetworkEngine.POST("/user/userarticle/getUserArticleList", parameters: ["start":0,"limit":listNum,"sort":"[{\"property\":\"dateAdd\",\"direction\":\"DESC\"}]","userCode":" ","stick":1]).responseObject { (response: Response<FindClubApplyResponse, NSError>) -> Void in
            
            if (response.result.value != nil){
                let indexRespon = response.result.value!
                self.clublistArray += indexRespon.data!
            }
        }
        /**
        路径
        /info/goodscomment/getGoodsComment
        
        提交方式
        POST
        
        传入参数
        {
        code:’3183e622bd7c4e50ae4fa3ac04c61d8c’//招聘信息编号/话题编号
        
        }
        
        返回参数
        {
        招聘信息评论
        userName：用户名
        commentContent：评论内容
        
        dataAdd：评论时间
        commentCode：评论编号
        
        评论话题信息
        logo：头像
        userName：用户名
        userCode：用户编号
        goodsCode：评论话题编号
        
        dateAdd：评论时间
        replyName：回复者名称
        commentContent：评论内容
        }        
        */
        
        
        NetworkEngine.POST("/info/goodscomment/getGoodsComment", parameters: ["code":"\(self.code!)"]).responseObject { (response: Response<FindClubApplyResponse, NSError>) -> Void in
            
            print("当前返回的评论内容--->",response.result.value)
            
            if (response.result.value != nil){
                let indexRespon = response.result.value!
                self.commentlistArray += indexRespon.data!
            }
            
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true);
        
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
    }
    

    
    //MARK: - tableviewD M
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        if section == 0 {
            if clublistArray.count == 0{
                return 1
            }else{
                return (clublistArray.count /  clublistArray.count)
            }
            
        }else{
            
            if commentlistArray.count == 0{
               
            return 1
                
            }else{
                return commentlistArray.count
            }
        }
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {

        if indexPath.section == 0{
            return 118
        }else{
            if commentlistArray.count == 0{
                return 200
            }else{
                print(commentlistArray.count)
                let cellString = self.commentlistArray[indexPath.row].articleContent! as NSString
                let attribute:NSDictionary = NSDictionary(dictionary: [NSFontAttributeName : UIFont.systemFontOfSize(15)])
                let cellSize = cellString.boundingRectWithSize(self.tableview.bounds.size, options:  .UsesLineFragmentOrigin , attributes: attribute as? [String : AnyObject], context: nil).size
                
                return cellSize.height + 10
            }
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("TopCell", forIndexPath: indexPath) as! TopicTableViewCell
            //let row = Int(pSelectedRow)
            if clublistArray.count == 0 {
                
            }else{
            
                cell.clubindexApply = clublistArray.last
            }
            
            return cell
            
        }else{
            
            if commentlistArray.count == 0{
                let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("NullDataCell", forIndexPath: indexPath)
                return cell
                
            }else{
                let cell = tableView.dequeueReusableCellWithIdentifier("ReplyCell", forIndexPath: indexPath) as! ReplyTableViewCell
                cell.clubindexApply = commentlistArray[indexPath.row]
                return cell
            }
            
        }

    }
    
    // MARK: - textfield delegate M
    func textViewDidChange(textView: UITextView) {

//        var textViewFrame = replyTextFiled.frame
//        let textSize = replyTextFiled.sizeThatFits(CGSizeMake(CGRectGetWidth(textViewFrame), 1000))
//        let offset:CGFloat = 2
//        replyTextFiled.scrollEnabled = (textSize.height + 0.1 > (28 - offset))
//        textViewFrame.size.height = max(28, min(56, textSize.height - 5))
//
//        if (textView.scrollEnabled) {
//            //textviewBottomConstraint.constant = 10
//            textView.scrollRangeToVisible(NSMakeRange((textView.text as NSString).length , 1))
//
//            self.replyTextFiled.setNeedsDisplay()
//            self.replyView.setNeedsDisplay()
//        }
//        replyTextFrame = textViewFrame
//        replyTextFiled.frame = textViewFrame
//
//        replyView.bounds.size.height = textViewFrame.height + 14
//        replyViewFrame = replyView.frame
        
    }
    
  
    
    func textViewDidBeginEditing(textView: UITextView) {

        self.replyTextFiled.becomeFirstResponder()
    }
    
    func textViewDidEndEditing(textView: UITextView) {

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
