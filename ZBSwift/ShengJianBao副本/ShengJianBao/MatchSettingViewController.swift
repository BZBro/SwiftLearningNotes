//
//  MatchSettingViewController.swift
//  ShengJianBao
//
//  Created by Mike on 16/1/10.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class MatchSettingViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var feedTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        feedTable.tableFooterView = UIView()
        self.title = "设置匹配条件"
        
        let barButton = UIBarButtonItem(title: "保存", style: .Plain, target: self, action: "handleSave")
        self.navigationItem.rightBarButtonItem = barButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func handleSave()  {
        
    }
    
    func onContentViewClick(sender:UITapGestureRecognizer){
        let point = sender.locationInView(contentView)
        let index =  point.y/48
        let intIndex = Int(floor(index))
        print(intIndex)
        
        switch intIndex{
        case 0:
            self.performSegueWithIdentifier("showCity", sender: nil)
            break
        default:
            break
        }
        
    }
    
    
    // MARK: TableView delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let section = indexPath.section
        if section == 0{
            let cell = tableView.dequeueReusableCellWithIdentifier("TSMatchSettingLocationId")
            return cell!
        }else if section == 1{
            let cell = tableView.dequeueReusableCellWithIdentifier("TSMatchSettingJobId")
            return cell!
        }else if section == 2{
            let cell = tableView.dequeueReusableCellWithIdentifier("TSMatchSettingGenderId")
            return cell!
        }else {
            let cell = tableView.dequeueReusableCellWithIdentifier("TSMatchSettingWorkTimeId")
            return cell!
        }
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
