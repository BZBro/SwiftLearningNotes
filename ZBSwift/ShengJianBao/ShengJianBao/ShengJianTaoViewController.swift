//
//  ShengJianTaoViewController.swift
//  ShengJianBao
//
//  Created by Mike on 16/1/11.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ShengJianTaoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadJobs()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadJobs(){
        let params = ["parenatId":"1","type":"1","sort":"[{\"property\":\"dateAdd\",\"direction\":\"DESC\"}]","_dc":NetworkEngine.Timestamp()]
        NetworkEngine.POST("/sys/sysdictionary/getDictCombo", parameters: params, encoding: .URL, headers: nil).responseObject { (response: Response<FindIndexApplyRespone, NSError>) -> Void in
            print(response.result.value?.totalRecord)
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TSDailyItemCell", forIndexPath: indexPath)
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showJobDetail", sender: nil)
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
