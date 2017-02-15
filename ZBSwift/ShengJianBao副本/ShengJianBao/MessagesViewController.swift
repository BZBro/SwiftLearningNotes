//
//  MessagesViewController.swift
//  ShengJianBao
//
//  Created by Mike on 16/1/10.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class MessagesViewController: BaseViewController{

    @IBOutlet weak var friendsContainer: UIView!
    @IBOutlet weak var inviteContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBtnClick(sender: UIButton) {
        if sender.tag == 0 {
            self.view.bringSubviewToFront(friendsContainer)
        }
        
        if sender.tag == 1 {
            self.view.bringSubviewToFront(inviteContainer)
        }
    }
    

    

}
