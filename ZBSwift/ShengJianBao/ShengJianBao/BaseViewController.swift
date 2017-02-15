//
//  BaseViewController.swift
//  ShengJianBao
//
//  Created by Mike on 15/12/20.
//  Copyright © 2015年 hyz. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        if self.navigationController?.viewControllers.count>1{
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(title:"返回", style:.Plain, target:self, action:"baseGoBack:")
        }
        */
        // Do any additional setup after loading the view.
    }
    
    func baseGoBack(sender:UIBarButtonItem){
        let count = self.navigationController?.viewControllers.count
        let destination = self.navigationController?.viewControllers[count!-2]
        
        let checkNavigationBarSegue = CheckNavigationBarSegue(identifier: "", source: self, destination: destination!) { () -> Void in
            
        }
        //self.prepareForSegue(checkNavigationBarSegue, sender: self)
        checkNavigationBarSegue.perform()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mainNavigationController() ->UINavigationController{
        let app:AppDelegate =  UIApplication.sharedApplication().delegate as! AppDelegate
        
        return (app.window?.rootViewController as? UINavigationController)!
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
