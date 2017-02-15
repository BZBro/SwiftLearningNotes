//
//  TSHotRankController.swift
//  ShengJianBao
//
//  Created by welsonla on 16/1/23.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class TSHotRankCateController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var listTable: UITableView!
    @IBOutlet weak var headerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TSHotRankCell") as! TSHotRankCell
        return cell
    }

}
