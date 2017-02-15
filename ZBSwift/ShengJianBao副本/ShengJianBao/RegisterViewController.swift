//
//  RegisterViewController.swift
//  ShengJianBao
//
//  Created by Mike on 15/12/20.
//  Copyright © 2015年 hyz. All rights reserved.
//

import UIKit

class RegisterViewController: BaseViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var mobileField: UITextField!
    @IBOutlet weak var codeField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var confirmField: UITextField!
    
    let loginService = LoginService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func onRegisterClick(sender: AnyObject) {
        let user:String? = self.nameField.text
        let mobile:String? = self.mobileField.text
        let code:String? = self.codeField.text
        let pass:String? = self.passField.text
        let confirmPass:String? = self.confirmField.text
        
        
        
        var message = String()
        if(user?.characters.count == 0
            || mobile?.characters.count == 0
            || code?.characters.count == 0
            || pass?.characters.count == 0
            || confirmPass?.characters.count == 0)
        {
            message = "请填写完整"
        }else if(pass != confirmPass){
            message = "两次密码输入不一致"
        }
        
        if(message.characters.count > 0){
            let alert = UIAlertView(title: "提示",
                message: message,
                delegate: nil,
                cancelButtonTitle: "知道了")
            
            alert.show()
            return
        }

        
        let regModel = MTRegister()
        regModel.user = user
        regModel.mobile = mobile
        regModel.code = code
        regModel.pass = pass
        
        loginService.register(regModel) { (result, data, error) -> Void in
            let message = data!["message"] as? String
            if(result==false){
                if(message!.characters.count > 0){
                    let alert = UIAlertView(title: "提示",
                        message: message,
                        delegate: nil,
                        cancelButtonTitle: "知道了")
                    
                    alert.show()
                    return
                }
            }else{
                if(message!.characters.count > 0){
                    let alert = UIAlertView(title: "提示",
                        message: message,
                        delegate: nil,
                        cancelButtonTitle: "知道了")
                    
                    alert.show()
                    
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func onSMSCodeClick(sender: AnyObject) {
        
        let mobile = self.mobileField.text
        if mobile?.characters.count == 0 || mobile?.characters.count != 11{
            let alert = UIAlertView(title: "提示",
                message: "手机号码必须为11位数字", delegate: nil, cancelButtonTitle: "知道了")
            alert.show()
            return
        }
        
        loginService.getMobileCode(mobile!) { (result, data, error) -> Void in
            let message = data!["message"] as? String
            if message?.characters.count > 0 {
                let alert = UIAlertView(title: "提示",
                    message: message, delegate: nil, cancelButtonTitle: "知道了")
                alert.show()
                return
            }
        }
    }
}
