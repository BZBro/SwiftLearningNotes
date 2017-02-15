//
//  TSHotRankListController.swift
//  ShengJianBao
//
//  Created by welsonla on 16/1/23.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class TSHotRankListController: BaseViewController, UITableViewDelegate, UITableViewDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 117
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TSHotRankDetailCell") as! TSHotRankDetailCell
        cell.contentView.backgroundColor = UIColor(red: CGFloat(Double(arc4random()%255)/255.0),
                                                 green: CGFloat(Double(arc4random()%255)/255.0),
                                                  blue: CGFloat(Double(arc4random()%255)/255.0), alpha: 1)
        return cell
    }

}
