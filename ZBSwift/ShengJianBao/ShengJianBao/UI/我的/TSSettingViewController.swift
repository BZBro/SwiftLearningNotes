//
//  TSSettingViewController.swift
//  ShengJianBao
//
//  Created by welsonla on 16/3/21.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class TSSettingViewController: UIViewController {

    @IBOutlet weak var logoutButton: CornerRadiusButton!
    
    @IBOutlet weak var settingTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if AppContext.isLogin(){
            logoutButton.hidden = false
        }else{
            logoutButton.hidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleLogout(sender: AnyObject) {
        AppContext.logout()
        self.view.setNeedsDisplay()
    }
}
