//
//  LoginViewController.swift
//  ShengJianBao
//
//  Created by Mike on 15/12/20.
//  Copyright © 2015年 hyz. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var accountField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    let loginService = LoginService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func onLoginClick(sender: AnyObject) {
        let account = self.accountField.text
        let password = self.passwordField.text
        
        if account?.characters.count == 0 || password?.characters.count == 0{
            let alert = UIAlertView(title: "提示", message: "请输入完整", delegate: nil, cancelButtonTitle: "知道了")
            alert.show()
            return
        }
        
        loginService.login(account!, pass: password! ,respon: { (result, data, error) -> Void in
            var message:String? = String()
            if(result == false){
                message = data!["message"] as? String
            }
            
            if message?.characters.count > 0{
                let alert = UIAlertView(title: "提示", message: message, delegate: nil, cancelButtonTitle: "知道了")
                alert.show()
                return
            }
            
            AppContext.saveUserLoginInfo(account!, userPwd: password!)
            
            
            self.dismissViewControllerAnimated(true, completion: nil)

        })
    }

    @IBAction func onNoLoginClick(sender: AnyObject) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    
    @IBAction func onFindPassWordCick(sender: AnyObject){
        
    }

    @IBAction func onRegisterClick(sender: AnyObject){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
