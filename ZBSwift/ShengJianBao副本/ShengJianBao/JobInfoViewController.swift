//
//  JobInfoViewController.swift
//  ShengJianBao
//
//  Created by Mike on 16/1/12.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class JobInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var infoTable: UITableView!
    var indexApply:MTIndexApply?
    
    @IBOutlet weak var onlineJoinButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

//        onlineJoinButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
//        favoriteButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableview delegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 80
        }else if indexPath.section == 1{
            return  342
        }else if indexPath.section == 2{
            return 125
        }
        
        return 44
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let section = indexPath.section
        if section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("TSJobTitleCellId", forIndexPath: indexPath) as! TSJobTitleCell
            cell.indexApply = indexApply
            return cell
        }else if section == 1{
            let cell = tableView.dequeueReusableCellWithIdentifier("TSJobInfoCellId", forIndexPath: indexPath) as! TSJobInfoCell
            cell.indexApply = indexApply
            return cell
        }else if section == 2{
            let cell = tableView.dequeueReusableCellWithIdentifier("TSJobHotlineCellId", forIndexPath: indexPath)
            return  cell
        }

        return tableView.dequeueReusableCellWithIdentifier("TSJobInfoCellId", forIndexPath: indexPath)
    }

    @IBAction func handleSign(sender: AnyObject) {
        if AppContext.isLogin() {
            NetworkEngine.POST("/user/sign/SaveSign", parameters: ["code":(self.indexApply?.recruitCode)!,"user":(AppContext.user()?.userCode)!]).responseString( completionHandler: { (response:Response<String,NSError>) -> Void in
                if let respString = response.result.value{
                    if respString ==  "1"{
                       TSUIKit.showProgressWithMessage("收藏成功", view: self.view, imageName: nil)
                    }else if respString == "2"{
                        TSUIKit.showProgressWithMessage("您已收藏过了", view: self.view, imageName: nil)
                    }
                }
            })
        }
    }
    
}
