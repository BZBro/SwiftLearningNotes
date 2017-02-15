//
//  HomeViewController.swift
//  ShengJianBao
//
//  Created by Mike on 15/12/20.
//  Copyright © 2015年 hyz. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class HomeViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var leftBarItem: UIBarButtonItem!
    @IBOutlet weak var rightBarItem: UIBarButtonItem!
    @IBOutlet weak var contentTableView: UITableView!
    
    var startIndex = 0
    var pageCount = 10
    
    var listArray = [MTIndexApply]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let topView :CYPullRefreshSimpleTopView = CYPullRefreshSimpleTopView()
        let buttomView :CYPullRefreshSimpleBottomView = CYPullRefreshSimpleBottomView()
        
        self.contentTableView.delegate = self
        self.contentTableView.dataSource = self
        self.contentTableView.cy_addPullDownHanlder({ () -> Void in
            
            }, topView: topView)
        self.contentTableView.cy_addPullUpHandler({ () -> Void in
            
            }, bottomView: buttomView)
        
        self.fetchApplyIndex()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchApplyIndex(){
        NetworkEngine.POST("/recruit/RecruitInfo/findIndexApply" ,parameters:["start":0,"limit":10,"sort":"[{\"property\":\"dateAdd\",\"direction\":\"DESC\"}]","_dc":NetworkEngine.Timestamp()]).responseObject { (response: Response<FindIndexApplyRespone, NSError>) -> Void in
            print(response.result.value?.totalRecord)
            
            if (response.result.value != nil){
                let indexRespon = response.result.value!
                self.listArray += indexRespon.data!
                self.contentTableView.reloadData()
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.listArray.count + 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var cellHeigt:CGFloat = 257.0
        if indexPath.row > 0{
            cellHeigt = 60.0
        }
        return cellHeigt
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        if indexPath.row == 0 {
           let  cell = tableView.dequeueReusableCellWithIdentifier("TSHomeBannerCell", forIndexPath: indexPath) as! TSHomeBannerCell
            cell.menuSelectBlock = {(buttonIndex) -> Void in
                self.showNextPageByButtonIndex(buttonIndex)
            }
            return cell
        }else{
           let cell = tableView.dequeueReusableCellWithIdentifier("HomeContentCell", forIndexPath: indexPath) as! HomeContentCell
            cell.indexApply = self.listArray[indexPath.row-1]
            return cell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("indexpath.row:\(indexPath.row)")
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if indexPath.row > 0 {
            let indexApply = self.listArray[indexPath.row-1]
            let story = UIStoryboard.init(name: "TaoShengJian", bundle: nil)
            let jobController = story.instantiateViewControllerWithIdentifier("JobsDetailViewController") as! JobsDetailViewController
            jobController.indexApply = indexApply
            jobController.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(jobController, animated: true)
        }
    }
    
    @IBAction func toMatchSetting(sender: AnyObject) {
        self.performSegueWithIdentifier("showMatchSetting", sender: nil)
    }
    
    func showNextPageByButtonIndex(tag:Int){

    }
    
    @IBAction func handleMessage(sender: AnyObject) {
        let story = UIStoryboard(name: "Message", bundle:nil)
        let messageController = story.instantiateInitialViewController() as! MessagesViewController
        messageController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(messageController, animated: true)
    }
}
