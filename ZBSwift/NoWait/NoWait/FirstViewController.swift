//
//  FirstViewController.swift
//  NoWait
//
//  Created by Admin on 15/9/17.
//  Copyright © 2015年 ZhangBin. All rights reserved.
//

import UIKit
import CoreData
class FirstViewController: UIViewController,UITextFieldDelegate{
    
    var timer:NSTimer?
    var timer1:NSTimer?
    var timer2:NSTimer?
    
    @IBOutlet weak var userTextfield: UITextField!
    @IBOutlet weak var passerwordTextField: UITextField!

    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var backGroundIMage: UIImageView!
    
    @IBOutlet weak var backGroundImage: UIImageView!

    @IBOutlet weak var ForgetMM: UIButton!
    @IBOutlet var Allview: UIView!
    //userID
    var userID :NSNumber?
    //用户是否存在
    var hadExist = false
    //密码是否正确
    var passwordTrue = false
    //用户是否已经登录
    var hadLogin = false
    //
    var tempstring:String?
    
    var managementObject:NSManagedObjectContext!

    let indivoView  = MAActivityIndicatorView()
    
    @IBAction func loginButton(sender: AnyObject) {
        storage()
        passwordTrue = false
    }
    @IBAction func registerButton(sender: AnyObject) {
        
    }
    @IBAction func ForgetMM(sender: AnyObject) {
        if userTextfield.text == nil {
            let alertNil = UIAlertController(title: "啊哦", message: "用户名不能为空", preferredStyle: UIAlertControllerStyle.Alert)
            let actionOK = UIAlertAction(title: "👌", style: UIAlertActionStyle.Cancel, handler: nil)
            alertNil.addAction(actionOK)
            presentViewController(alertNil, animated: true, completion: nil)
            userTextfield.clearsOnBeginEditing = true
            passerwordTextField.clearsOnBeginEditing = true
        }
        else {
            if existUser(userTextfield.text) {
                tempstring = findRemind(userTextfield.text)
                if tempstring!.isEmpty{
                    let alertNil = UIAlertController(title: "啊哦", message: "这个用户没有密码提示", preferredStyle: UIAlertControllerStyle.Alert)
                    let actionOK = UIAlertAction(title: "👌", style: UIAlertActionStyle.Cancel, handler: nil)
                    alertNil.addAction(actionOK)
                    presentViewController(alertNil, animated: true, completion: nil)
                }else{
                    performSegueWithIdentifier("ToForgetVC", sender: nil)
                }
               
            }
            else{
                let alert = UIAlertController(title: "注意", message: "没有这个用户啊", preferredStyle: UIAlertControllerStyle.Alert)
                let action = UIAlertAction(title: "👌", style: UIAlertActionStyle.Cancel, handler: nil)
                alert.addAction(action)
                presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        hadLogin = NSUserDefaults.standardUserDefaults().boolForKey("login")
        let colorspaceref:CGColorSpaceRef = CGColorSpaceCreateDeviceRGB()!
        let color:[CGFloat] = [1,1,1,1]
        let colorspace:CGColorRef = CGColorCreate(colorspaceref,color)!
        loginButton.layer.borderWidth = 1.0
        registerButton.layer.borderWidth = 1.0
        loginButton.layer.borderColor = colorspace
        registerButton.layer.borderColor = colorspace
        if hadLogin{
            self.perform()
        }
        Textcolor()
        printDocumentPath()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        timer2 = NSTimer.scheduledTimerWithTimeInterval(4, target: self, selector: #selector(FirstViewController.runFadeAnimation), userInfo: nil, repeats: true)
        timer2?.fire()
        ForgetMM.enabled = false
        ForgetMM.alpha = 0.0
        passerwordTextField.delegate = self
        userTextfield.delegate = self
    }
    
    func runFadeAnimation(){
        
        backGroundIMage.image = UIImage(named: "\(arc4random_uniform(17) + 1).jpg")
        backGroundImage.alpha = 0.2
        UIView.animateWithDuration(2, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.backGroundIMage.alpha = 0.5
            self.backGroundImage.alpha = 1
            self.backGroundIMage.image = self.backGroundImage.image
            self.backGroundImage.image = UIImage(named: "\(arc4random_uniform(17) + 1 ).jpg")
            
            }) { (finished) -> Void in
                
        }
        
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.passerwordTextField.resignFirstResponder()
        self.userTextfield.resignFirstResponder()
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        ForgetMM.enabled = true
        ForgetMM.alpha = 1
        let frame  = textField.frame
        let offset = frame.origin.y + 32 - (self.view.frame.size.height - 288)
        if offset > 0 {
            self.view.frame = CGRectMake(0.0, -offset, self.view.frame.width, self.view.frame.height)
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if textField == passerwordTextField {
            textField.resignFirstResponder()
            return true
        }
        else if textField == userTextfield {
            textField.resignFirstResponder()
            return true
        }
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        ForgetMM.enabled = false
        ForgetMM.alpha = 0
        self.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ToRegisterVC"{
          let navVC = segue.destinationViewController as! UINavigationController
          let VC = navVC.topViewController as! RegiterViewController
          VC.managementObjectContext = managementObject
        
        }
        if segue.identifier == "ToLOginVC"{
            let tabbarController = segue.destinationViewController as! UITabBarController
            
            let navgationController1 = tabbarController.viewControllers![0] as! UINavigationController
            let footMarkVC = navgationController1.topViewController as! MydailyViewController
            footMarkVC.myID = NSUserDefaults.standardUserDefaults().integerForKey("USERID")
            
            footMarkVC.managedObjectContext = managementObject
            
            let navgationController2 = tabbarController.viewControllers![1] as! UINavigationController
            let editVC = navgationController2.topViewController as! EditViewController
            
            editVC.managementObjectEdit = managementObject

            editVC.myID = NSUserDefaults.standardUserDefaults().integerForKey("USERID")

        }
        if segue.identifier == "ToForgetVC" {
            
            let forgetVC = segue.destinationViewController as! ForgetViewController
            forgetVC.remindString = tempstring!
            print("\(tempstring)")
        }
    }
    
    func Textcolor(){
        let defaultcolor = UIColor(red: 155, green: 238, blue: 255, alpha: 0.8)
        userTextfield.backgroundColor = defaultcolor
        passerwordTextField.backgroundColor = defaultcolor
    }


    //登录存储到数据库
    func storage(){
        let username = userTextfield.text
        let userpass = passerwordTextField.text as NSString!
        if username == nil || userpass.length == 0 {
            let alertNil = UIAlertController(title: "啊哦", message: "用户名或密码不能为空", preferredStyle: UIAlertControllerStyle.Alert)
            let actionOK = UIAlertAction(title: "👌", style: UIAlertActionStyle.Cancel, handler: nil)
            alertNil.addAction(actionOK)
            presentViewController(alertNil, animated: true, completion: nil)
            userTextfield.clearsOnBeginEditing = true
            passerwordTextField.clearsOnBeginEditing = true
        }
        else if userpass.length < 6 && username != nil {
            let alertLength = UIAlertController(title: "啊哦", message: "密码长度不能小于6位", preferredStyle: UIAlertControllerStyle.Alert)
            let lengthAction = UIAlertAction(title: "👌", style: UIAlertActionStyle.Cancel, handler: nil)
            alertLength.addAction(lengthAction)
            presentViewController(alertLength, animated: true, completion: nil)
            userTextfield.clearsOnBeginEditing = true
            passerwordTextField.clearsOnBeginEditing = true
        }
        else {
            if existUser(username) {
                if existPass(username, stringPass: userpass) {
                    NSUserDefaults.standardUserDefaults().setBool(true, forKey: "Login")
                    NSUserDefaults.standardUserDefaults().setInteger(Int(userID!), forKey: "USERID")
                    //跳到下一个页面
                    insertBlurView(Allview, style: UIBlurEffectStyle.Light)
                    timer1 = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(FirstViewController.waitprocesss), userInfo: nil, repeats: true)
                    waitProcess(Allview, indicatorView: indivoView)
                    timer = NSTimer.scheduledTimerWithTimeInterval(4, target: self, selector: #selector(FirstViewController.perform), userInfo: nil, repeats: false)
                }else{
                    
                    sleep(1)
                    let alert = UIAlertController(title: "注意", message: "密码错误请重试", preferredStyle: UIAlertControllerStyle.Alert)
                    let action = UIAlertAction(title: "👌", style: UIAlertActionStyle.Cancel, handler: {_ in
                        
                    })

                    alert.addAction(action)
                    presentViewController(alert, animated: true, completion: nil)
                }
                
            }else{
                let alert = UIAlertController(title: "注意", message: "没有这个用户哦，可以注册一个哦", preferredStyle: UIAlertControllerStyle.Alert)
                let action = UIAlertAction(title: "👌", style: UIAlertActionStyle.Cancel, handler: nil)
                alert.addAction(action)
                
                presentViewController(alert, animated: true, completion: nil)
            }
        }
        
    }
    func waitprocesss(){
        waitProcess(Allview, indicatorView: indivoView)
    }
    func perform(){
        timer1?.invalidate()
        timer?.invalidate()
        timer2?.invalidate()
        performSegueWithIdentifier("ToLOginVC", sender: nil)    
    }
    //判断用户是否存在
    func existUser(stringUser:String?) ->Bool{
        let fecthUser = NSFetchRequest(entityName: "Users")
        
        fecthUser.predicate = NSPredicate(format: "name == %@", stringUser!)
        do {
            let tempUser = try managementObject.executeFetchRequest(fecthUser) as! [Users]
            if !tempUser.isEmpty{
                hadExist = true
            }
        }catch{
            fatalError()
        }
        return hadExist
    }
    func existPass(stringUser:String?,stringPass:NSString?) -> Bool{
        let fecthUser = NSFetchRequest(entityName: "Users")
        
        fecthUser.predicate = NSPredicate(format: "name == %@ && password == %@", stringUser!,stringPass!)
        do {
            let tempUser = try managementObject.executeFetchRequest(fecthUser) as! [Users]
            if !tempUser.isEmpty{
                passwordTrue = true
                userID = tempUser[0].userID!
            }
        }catch{
            fatalError()
        }
        return passwordTrue
    }
    //查找密码提示
    func findRemind(stringUser:String?) -> String{
        let tempString:String?
        let fetch = NSFetchRequest(entityName: "Users")
        fetch.predicate = NSPredicate(format: "name == %@", stringUser!)
        do {
            let tempUser = try managementObject.executeFetchRequest(fetch) as! [Users]
            tempString = tempUser[0].codemind
            
        }catch{
            fatalError()
        }
        return tempString!
    }
    //查找userID
    func findUserID(stringUser:String?) -> NSNumber{
        let fetch = NSFetchRequest(entityName: "Users")
        fetch.predicate = NSPredicate(format: "name == %@", stringUser!)
        do {
            let tempUser = try managementObject.executeFetchRequest(fetch) as! [Users]
            userID = tempUser[0].userID!
            
        }catch{
            fatalError()
        }
        return userID!
    }
  

    
}
