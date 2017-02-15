//
//  DiscuzViewController.swift
//  ShengJianBao
//
//  Created by Mike on 15/12/20.
//  Copyright © 2015年 hyz. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import IQKeyboardManagerSwift



class DiscuzViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {
    
    var code = String()
    
    //
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var rightBarButtonItem: UIBarButtonItem!
    
    var clublistArray = [MTClubApply]()
    
    var hud = MBProgressHUD()
    
    var defalutRequestNum = 20
    
    let topView :CYPullRefreshSimpleTopView = CYPullRefreshSimpleTopView()
    
    let buttomView :CYPullRefreshSimpleBottomView = CYPullRefreshSimpleBottomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //测试修改
        let reachability = Reachability.reachabilityForInternetConnection()
        //判断连接类型
        if reachability!.isReachableViaWiFi() {
            print("连接类型：WiFi")
        }else if reachability!.isReachableViaWWAN() {
            print("连接类型：移动网络")
        }
        

        self.automaticallyAdjustsScrollViewInsets = false
        
        
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.tableview.cy_addPullDownHanlder({ () -> Void in
            
            self.clublistArray.removeAll()
            self.getPost(self.defalutRequestNum)
            
            }, topView: topView)
        self.tableview.cy_addPullUpHandler({ () -> Void in
            self.defalutRequestNum = self.defalutRequestNum + 20
            self.getPost(self.defalutRequestNum)
            
            }, bottomView: buttomView)
        
        
        hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        hud.labelText = "加载中"
        hud.mode = .Indeterminate
        hud.opacity = 0.5
        
        self.getPost(20)
        
    }
    
    
    @IBAction func rightBarButtonItemT(sender: AnyObject) {
        
    }
    
    
    
    func getPost(listnum:Int){
        
        
        if !AppContext.isReachability(){
            
            AppContext.addNetError(self)
            
        }else{
            
            NSTimer.scheduledTimerWithTimeInterval(10, target: self, selector: "getPostFail", userInfo: nil, repeats: true)
            
            let workingQueue = dispatch_queue_create("_workQueue", nil)
            // 派发到刚创建的队列中，GCD 会负责进行线程调度
            dispatch_async(workingQueue) {
                // 在 workingQueue 中异步进行
                self.getNews(listnum)
                NSThread.sleepForTimeInterval(1)
                if self.clublistArray.count == 0 {
                    
                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                    hud.labelText = "无最新数据"
                    hud.mode = .Text
                    hud.opacity = 0.5
                    hud.hide(true, afterDelay: 1)
                }
                else{
                    dispatch_async(dispatch_get_main_queue()) {
                        // 返回到主线程更新 UI
                        self.hud.hide(true)
                        self.tableview.reloadData()
                        self.tableview.cy_stopLoad()
                    }
                }
            }
            
        }
        
    }
    
    func getPostFail(){
        self.hud.hide(true)
        let midx = self.view.bounds.midX
        let midy = self.view.bounds.midY 
        let rect = CGRectMake(midx - 30, midy - 10, 60, 20)
        let button = UIButton(frame: rect)
        button.setTitle("点击重试", forState: UIControlState.Normal)
        button.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(button)
        button.addTarget(self, action: "getPost", forControlEvents: .TouchUpInside)
        button.removeFromSuperview()
    }
    
    //MARK: - getNews
    func getNews(listnum:Int){

        if self.defalutRequestNum == 20 {
            NetworkEngine.POST("/user/userarticle/getUserArticleList", parameters: ["start":0,"limit":listnum,"sort":"[{\"property\":\"dateAdd\",\"direction\":\"DESC\"}]","userCode":" ","stick":1]).responseObject { (response: Response<FindClubApplyResponse, NSError>) -> Void in
                
                if (response.result.value != nil){
                    let indexRespon = response.result.value!
                    self.clublistArray += indexRespon.data!
                    self.tableview.reloadData()
                }
            }
        }else{
            NetworkEngine.POST("/user/userarticle/getUserArticleList", parameters: ["start":self.clublistArray.count,"limit":listnum,"sort":"[{\"property\":\"dateAdd\",\"direction\":\"DESC\"}]","userCode":" ","stick":1]).responseObject { (response: Response<FindClubApplyResponse, NSError>) -> Void in
                let listnum = self.clublistArray.count
                if (response.result.value != nil){
                    let indexRespon = response.result.value!
                    self.clublistArray += indexRespon.data!
                    if listnum == self.clublistArray.count {
                        self.tableview.reloadData()
                    }else{
                        self.tableview.reloadData()
                    }
                    
                }
            }
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
    
    @IBAction func onToSubmitClick(sender: UIButton) {
        if AppContext.isLogin(){
            let story = UIStoryboard.init(name: "Club", bundle: nil)
            let topicDetailVC = story.instantiateViewControllerWithIdentifier("publishVC") as! PublishViewController
            
            //topicDetailVC.indexApply = indexApply
            topicDetailVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(topicDetailVC, animated: true)
        }else{
            AppContext.showLogin(self)
        }
 
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return self.clublistArray.count
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var cellHeigt:CGFloat = 118.0
        if indexPath.section >= 1{
            cellHeigt = 118.0
        }
        return cellHeigt
    }
    //MARK: - CEllforrow
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TopicCell", forIndexPath: indexPath) as! TopicTableViewCell
        print(indexPath.row)
 
        if clublistArray.count == 0 {
            
            
        }else{
            cell.code = self.clublistArray[indexPath.row].code!
            cell.clubindexApply = self.clublistArray[indexPath.row]
        }
        
        return cell
        
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        
        if  !AppContext.isReachability(){
        
            AppContext.showNetError(self)
            
        }else{
            let story = UIStoryboard.init(name: "Club", bundle: nil)
            let topicDetailVC = story.instantiateViewControllerWithIdentifier("toppicDetailVC") as! TopicDetailViewController
            NSNotificationCenter.defaultCenter().addObserver(topicDetailVC, selector: "getCode:", name: "codeStringNoti", object: nil)
            //topicDetailVC.indexApply = indexApply
            topicDetailVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(topicDetailVC, animated: true)
            
            let selected:Int = indexPath.row
            
            let dic = ["codename":"\(self.clublistArray[indexPath.row].code!)",
                "cellnum":"\(String(selected))",
                "celltag":"\(indexPath.row)"
            ];
            NSNotificationCenter.defaultCenter().postNotificationName("codeStringNoti", object: dic)
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
    

}
