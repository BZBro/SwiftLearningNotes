//
//  ForgetViewController.swift
//  ShengJianBao
//
//  Created by welsonla on 16/1/27.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class ForgetViewController: BaseViewController {

    @IBOutlet weak var mobileField: UITextField!
    @IBOutlet weak var codeField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var confirmField: UITextField!
    
    let loginService = LoginService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func handleConfirm(sender: AnyObject) {
        let mobile = self.mobileField.text
        let code = self.codeField.text
        let pass = self.passField.text
        let confirmPass = self.confirmField.text
        
        if(mobile?.characters.count == 0
          || code?.characters.count == 0
          || pass?.characters.count == 0
          || confirmPass?.characters.count == 0){
                let alert = UIAlertView(title: "提示", message: "请填写完整", delegate: nil, cancelButtonTitle: "知道了")
                alert.show()
                return
        }
    }
    
    @IBAction func handleResetCode(sender: AnyObject) {
        let mobile = self.mobileField.text
        if mobile?.characters.count == 0{
            let alert = UIAlertView(title: "提示", message: "请填写正确的手机号", delegate: nil, cancelButtonTitle: "知道了")
            alert.show()
            return
        }
        
//        loginService.getResetMobileCode(mobile!) { (result, data, error) -> Void in
//            var message:String? = data!["message"]
//            if message?.characters.count > 0 {
//                let alert = UIAlertView(title: "提示",
//                    message: message, delegate: nil, cancelButtonTitle: "知道了")
//                alert.show()
//                return
//            }
//        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
