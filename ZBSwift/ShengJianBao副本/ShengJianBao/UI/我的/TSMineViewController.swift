//
//  TSMineViewController.swift
//  ShengJianBao
//
//  Created by welsonla on 16/1/24.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class TSMineViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    var version:String?
    var user:MTUser?
    var userAct: MTUserActive?
    @IBOutlet weak var mineTable: UITableView!
    
    var menuTitles = ["基本资料","站内消息","新版检测","关于我们","我的设置"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bundleDict = NSBundle.mainBundle().infoDictionary
        version = bundleDict!["CFBundleShortVersionString"]! as? String
        user = AppContext.user()
        if AppContext.isLogin() {
            self.getUserActiveCount()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getUserActiveCount() ->  Void{
        NetworkEngine.POST("/user/statistics/getEntityByCode", parameters: ["user":AppContext.getToken()], encoding: .URL, headers: nil).responseObject { (response:Response<MTUserActive, NSError>) in
            if(response.result.value != nil){
                self.userAct = response.result.value
                self.mineTable.reloadData()
            }
        }
    }
    
    @IBAction func handleRightItem(sender: AnyObject) {
        let story = UIStoryboard(name: "Message", bundle:nil)
        let messageController = story.instantiateInitialViewController() as! MessagesViewController
        messageController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(messageController, animated: true)
    }
    
    @IBAction func handleLogin(sender: AnyObject) {
        let story = UIStoryboard(name: "Login", bundle: nil)
        let loginNav = story.instantiateInitialViewController()!
        self.presentViewController(loginNav, animated: true, completion: nil)
    }
    
    
    // MARK: Tableview delegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowCount = 0
        switch section{
            case 0:
                rowCount = 1
                break;
            case 1:
                rowCount = 6
                break;
            default:
                break;
        }
        
        return rowCount
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 135
        }else{
            if indexPath.row == 0{
                return 150
            }else{
                return 44
            }
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0.5
        }else{
            return 10
        }
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.5
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        
        if section == 0{
            let cell = tableView.dequeueReusableCellWithIdentifier("TSMineInfoCell") as! TSMineInfoCell
            cell.user = user
            cell.userAct = userAct
            return cell
        }else{
            if row == 0{
                let cell =  tableView.dequeueReusableCellWithIdentifier("TSMineMenuCell") as! TSMineMenuCell
                return cell
            }else{
                let cell = tableView.dequeueReusableCellWithIdentifier("TSMineListCell") as! TSMineListCell
                cell.title.text = self.menuTitles[row-1]
                cell.icon.image = UIImage(named: self.menuTitles[row-1])
                
                if row == 3{
                    cell.rightLabel.text = "V\(version!)"
                    cell.rightLabel.hidden = false
                }else{
                    cell.rightLabel.hidden = true
                }
                return cell
            }
        }
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        var edge = cell.separatorInset
        edge.left = 0
        cell.separatorInset = edge
        if Float(UIDevice.currentDevice().systemVersion)>=8{
            cell.layoutMargins.left = 0
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let section = indexPath.section
        let row = indexPath.row
        
        if section == 0{
            return
        }
        
        switch row{
        case 1:
            let infoController = UIStoryboard(name: "Mine", bundle: nil).instantiateViewControllerWithIdentifier("TSMineInfoController")
            infoController.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(infoController, animated: true)
            break;
        case 2:
            let noticeController = TSMineNoticeController()
            noticeController.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(noticeController, animated: true)
            break;
        case 3:
            let alert = UIAlertView.init(title: "提示", message: "\(version!)已是最新版本", delegate: nil, cancelButtonTitle: "知道了")
            alert.show()
            break;
        case 4:
            self.showAboutPage()
            break;
        case 5:
            self.showSettingController()
            break;
        case 6:
            break;
        default:
            break;
        }
    }
    
    func showAboutPage(){
        let aboutController = TSAboutUsController()
        aboutController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(aboutController, animated: true)
    }
    
    func showSettingController(){
        let settingController = TSSettingViewController()
        settingController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(settingController, animated: true)
    }

}
