//
//  TSJobBusinessInfoController.swift
//  ShengJianBao
//
//  Created by welsonla on 16/3/30.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class TSJobBusinessInfoController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var code:String?
    var bussinessInfo:MTBusinessInfo?
    @IBOutlet weak var infoTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoTable.estimatedRowHeight = 44
        self.edgesForExtendedLayout = UIRectEdge.None
        infoTable.delegate = self
        infoTable.dataSource = self
        
        self.fetchBusinessInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchBusinessInfo() {
        if let usercode = code{
            NetworkEngine.POST("/business/BusinessInfo/getBusinessInfoByCode", parameters: ["code":usercode]).responseObject { (response: Response<MTBusinessInfo,NSError>) -> Void in
                if(response.result.value != nil){
                    self.bussinessInfo = response.result.value
                    self.infoTable.reloadData()
                }
            }
        }
    }
    
    func fetchComments() {
//        if let usercode = code{
//            NetworkEngine.Post("/business/BusinessInfo/getBusinessCommentByBusinessCode",parameters:["code":usercode]).responseObject{
//                
//            }
//        }
    }
    
    // MARK: - UITableView delegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if (self.bussinessInfo) != nil {
            return 3
        }
        return 0
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            break
        case 1:
            return 1
        case 2:
            break
        default:
            break;
        }
        
        return 1
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("TSBusinessBaseInfoCellId", forIndexPath: indexPath) as! TSBusinessBaseInfoCell
            let imagePath = ShengJianURL.domain+"\(self.bussinessInfo!.userPhoto!)"
            cell.companyImage.sd_setImageWithURL(NSURL(string: imagePath))
            cell.address.text = self.bussinessInfo?.addrDetail
            cell.companyName.text = self.bussinessInfo?.userName
    
            return cell
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("TSBusinessContextCellId", forIndexPath: indexPath) as! TSBusinessContextCell
            cell.companyDesc.text = self.bussinessInfo!.userIntroduce
            return cell
        case 2:
            if indexPath.row == 0{
                let cell = tableView.dequeueReusableCellWithIdentifier("TSBusinessCommentScoreCellId", forIndexPath: indexPath) as! TSBusinessCommentScoreCell
                return cell
            }else{
                let cell = tableView.dequeueReusableCellWithIdentifier("TSBusinessCommentDetailCellId", forIndexPath: indexPath) as! TSBusinessCommentDetailCell
                return cell
            }
        case 3:
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCellWithIdentifier("TSBusinessWorkTotalCellId", forIndexPath: indexPath) as! TSBusinessWorkTotalCell
                return cell
            }else{
                let cell = tableView.dequeueReusableCellWithIdentifier("TSBusinessWorkCellId", forIndexPath: indexPath) as! TSBusinessWorkCell
                return cell
            }

        default:
            break;
        }
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TSBusinessBaseInfoCellId", forIndexPath: indexPath) as! TSBusinessBaseInfoCell
        return cell
    }

    

}
