//
//  TSMineNoticeController.swift
//  ShengJianBao
//
//  Created by welsonla on 16/2/16.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class TSMineNoticeController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var listTable: UITableView!
    
    var pageStart = 0
    let pageLimit = 10
    var messageData:GetUserMessageListIndex?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "通知"
        
        let nib = UINib(nibName: "TSMineNoticeCell", bundle: nil)
        listTable.registerNib(nib, forCellReuseIdentifier: "TSMineNoticeCell")
        
        self.loadData(pageStart, limit: pageLimit)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadData(start:Int,limit:Int){
        if let user = AppContext.user(){
            UserInfoService().getUserNotify(user.userCode!, start:"\(pageStart)", limit: "\(pageLimit)", respon: { (result, data, error) in
                self.messageData = data as? GetUserMessageListIndex
                self.listTable.reloadData()
            })
        }
    }
    
    // MARK: TableView Delegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let mData = messageData {
           return (mData.data?.count)!
        }
        return 0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TSMineNoticeCell") as! TSMineNoticeCell
        let msg = messageData?.data![indexPath.row]
        cell.configCell(msg!)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView .deselectRowAtIndexPath(indexPath, animated: true)
    }
}
