//
//  CityViewController.swift
//  ShengJianBao
//
//  Created by Mike on 16/1/10.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

enum LocationState {
    case Locationing,LocationFinish,LocationFail
}

class CityViewController: BaseViewController ,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var listTable: UITableView!
    var locationManager:TSLocationManager = TSLocationManager.shareInstance
    var locality:String?
    var locationState = LocationState.Locationing
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.startLocation()
        locationManager.completeBlock = {(locality,error) -> Void in
            if((error) != nil){
                self.locationState = .LocationFail
            }else{
                self.locationState = .LocationFinish
                self.locality = locality!
            }
            self.listTable.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if (indexPath.section == 0){
            return 44
        }else{
            return 43
        }
    }
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 1
        }else{
            return 1
        }
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section  == 0{
            let cell = tableView.dequeueReusableCellWithIdentifier("TSCityHeaderCell", forIndexPath: indexPath) as! TSCityHeaderCell
            switch locationState {
            case .LocationFinish:
                cell.locationLabel.text = self.locality
            case .LocationFail:
                cell.locationLabel.text = "定位失败，点击重试"
            default:
                cell.locationLabel.text = "定位中..."
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("CityCell", forIndexPath: indexPath)
            return cell
        }
    }
}
