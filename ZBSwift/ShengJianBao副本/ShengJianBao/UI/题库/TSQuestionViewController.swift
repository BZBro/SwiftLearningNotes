//
//  TSQuestionViewController.swift
//  ShengJianBao
//
//  Created by welsonla on 16/1/23.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class TSQuestionViewController: BaseViewController{

    @IBOutlet weak var officeController: UIView!
    @IBOutlet weak var dealerController: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func handleSwitch(sender: AnyObject) {
        if sender.tag == 0 {
            self.view.bringSubviewToFront(self.dealerController)
        }else if sender.tag == 1 {
            self.view.bringSubviewToFront(officeController)
        }
    }

}
