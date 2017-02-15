//
//  TSChatViewController.swift
//  ShengJianBao
//
//  Created by welsonla on 16/1/21.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class TSChatViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var listTable: UITableView!
    @IBOutlet weak var chatText: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        chatText.layer.cornerRadius = 5
        chatText.layer.borderColor = UIColor.grayColor().CGColor
        chatText.layer.borderWidth = 0.5
        
        sendButton.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0{
            let cell = tableView.dequeueReusableCellWithIdentifier("TSChatMineCell") as! TSChatMineCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("TSChatOtherCell") as! TSChatOtherCell
            return cell
        }
        
        
    }

}
