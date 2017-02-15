//
//  CheckNavigationBarSegue.swift
//  ShengJianBao
//
//  Created by Mike on 15/12/20.
//  Copyright © 2015年 hyz. All rights reserved.
//

import UIKit

class CheckNavigationBarSegue: UIStoryboardSegue {
    override func perform() {
        //self.destinationViewController
        
        if let loginViewController = self.sourceViewController as? LoginViewController{
            loginViewController.navigationController?.setNavigationBarHidden(false, animated: true)
            loginViewController.navigationController?.pushViewController(self.destinationViewController, animated: true)
            
        }else if let loginViewController = self.destinationViewController as? LoginViewController{
            loginViewController.navigationController?.setNavigationBarHidden(true, animated: true)
            self.sourceViewController.navigationController?.popToRootViewControllerAnimated(true)
        }

    }
}
