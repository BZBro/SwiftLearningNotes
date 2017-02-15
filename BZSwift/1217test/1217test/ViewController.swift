//
//  ViewController.swift
//  1217test
//
//  Created by ZBin on 15/12/18.
//  Copyright © 2015年 ZBin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var selftableview: UITableView!
    @IBOutlet weak var textfiledview: UITextField!
    @IBOutlet weak var viewbottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var textView: UIView!
    
    let countarray:NSMutableArray = ["sss","ss",24,44,453,453]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "textchange:", name: UIKeyboardWillChangeFrameNotification, object: nil)
        
    }
    func textchange(noti:NSNotification){
        NSLog("ssssss\(noti)")
        
        let viewH = UIScreen.mainScreen().bounds.size.height
        
        let keyfrm = noti.userInfo![UIKeyboardFrameEndUserInfoKey]!.CGRectValue!
        
        let keyH = keyfrm.origin.y
        
        self.viewbottomConstraint.constant = viewH - keyH
        
    }


    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //self.textfiledview.resignFirstResponder()
        countarray.addObject(textField.text!)
        self.selftableview.reloadData()
        let indexpath = NSIndexPath.init(forRow: countarray.count - 1, inSection: 0)
        self.selftableview.scrollToRowAtIndexPath(indexpath, atScrollPosition: UITableViewScrollPosition.Bottom, animated: true )
        return true
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countarray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.textLabel?.text = countarray[indexPath.row].stringValue
        
        return cell
    }
}

