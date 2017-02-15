//
//  InviteViewController.swift
//  ShengJianBao
//
//  Created by Mike on 16/1/10.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class InviteViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TSFriendInviteCell") as! TSFriendInviteCell
        if indexPath.row % 2 == 0{
            cell.actionButton.enabled = true
            cell.actionButton.backgroundColor = UIColor(red:0.51, green:0.75, blue:0.21, alpha:1)
        }else{
            cell.actionButton.enabled = false
            cell.actionButton.backgroundColor = UIColor.clearColor()
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }

}
