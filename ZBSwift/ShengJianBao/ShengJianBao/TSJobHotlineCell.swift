//
//  TSJobHotlineCell.swift
//  ShengJianBao
//
//  Created by welsonla on 16/4/5.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class TSJobHotlineCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func handleCall(sender: AnyObject) {
        let alert = UIAlertView.bk_showAlertViewWithTitle("", message: "确认拨打4001074088", cancelButtonTitle: "取消", otherButtonTitles: ["拨打"]) { (alert, index) in
            if index == 1{
               UIApplication.sharedApplication().openURL(NSURL(string: "tel:4001074088")!)
            }
        }
        
        alert.show()
        
    }
}
