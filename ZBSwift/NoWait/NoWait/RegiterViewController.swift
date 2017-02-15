//
//  RegiterViewController.swift
//  NoWait
//
//  Created by Admin on 15/9/26.
//  Copyright © 2015年 ZhangBin. All rights reserved.
//

import UIKit
import CoreData
class RegiterViewController: UIViewController,UITextFieldDelegate {
    
    var timer:NSTimer!
    var timer2:NSTimer!
    @IBOutlet weak var backGroundIMage: UIImageView!
    @IBOutlet weak var backGroundImage: UIImageView!
    
    @IBOutlet weak var AllView: UIView!
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var againPassword: UITextField!
    
    @IBOutlet weak var codemind: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    var managementObjectContext:NSManagedObjectContext!
    
    var hasExist = false
    
    let indivoView  = MAActivityIndicatorView()
    
    @IBAction func done(sender: AnyObject) {
        
            self.storage()

    }
    @IBAction func cancel(){
        self.performSegueWithIdentifier("returnFirstVC", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.enabled = false
        let colorspaceref:CGColorSpaceRef = CGColorSpaceCreateDeviceRGB()!
        let color:[CGFloat] = [1,1,1,1]
        let colorspace:CGColorRef = CGColorCreate(colorspaceref,color)!
        registerButton.layer.borderWidth = 1
        registerButton.layer.borderColor = colorspace
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
         timer2 = NSTimer.scheduledTimerWithTimeInterval(4, target: self, selector: #selector(RegiterViewController.runFadeAnimation), userInfo: nil, repeats: true)
        timer2.fire()
        color()
        self.password.delegate = self
        self.againPassword.delegate = self
        self.name.delegate = self
        self.codemind.delegate = self
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
    func color(){
        let defaultcolor = UIColor(red: 155, green: 238, blue: 255, alpha: 0.8)
        name.backgroundColor = defaultcolor
        password.backgroundColor = defaultcolor
        againPassword.backgroundColor = defaultcolor
        codemind.backgroundColor = defaultcolor
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //存储
    func storgeUser(){
        let username = name.text
        let userpass = password.text
        
        let count = NSNumber(int:Int32(arc4random_uniform(999)))
        if checkuserIDExist(count){
            self.storgeUser()
        }
        else{
            let entity = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: self.managementObjectContext) as! Users
            
            entity.name = username
            entity.password = userpass
            entity.codemind = codemind.text
            entity.userID = count
            
            do{
                try self.managementObjectContext.save()
            }catch{
                fatalError()
            }
        }
    }
    
    //查询userID是否已经存在
    
    func checkuserIDExist(num:NSNumber) -> Bool{
        
        let fecthUser = NSFetchRequest(entityName: "Users")
        
        fecthUser.predicate = NSPredicate(format: "userID == %@", num)
        do {
            let tempUser = try managementObjectContext.executeFetchRequest(fecthUser) as! [Users]
            if !tempUser.isEmpty{
                return true
            }
            else{
                return false
            }
        }catch{
            fatalError()
        }

    }
    
    //存储用户名和密码
    func storage(){
        let username = name.text as NSString!
        let userpass = password.text as NSString!
        let againpass = againPassword.text as NSString!
        if username.length == 0 || userpass.length == 0 {
            let alertNil = UIAlertController(title: "啊哦", message: "用户名或密码不能为空", preferredStyle: UIAlertControllerStyle.Alert)
            let actionOK = UIAlertAction(title: "👌", style: UIAlertActionStyle.Cancel, handler: nil)
            alertNil.addAction(actionOK)
            presentViewController(alertNil, animated: true, completion: nil)
            name.clearsOnBeginEditing = true
            password.clearsOnBeginEditing = true
        }
        else if againpass.length == 0{
            let alert = UIAlertController(title: "注意", message: "请再次输入密码", preferredStyle: UIAlertControllerStyle.Alert)
            let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            alert.addAction(action)
            presentViewController(alert, animated: true, completion: nil)
        }
        else if existUser(username as String) == true {
            let alertNil = UIAlertController(title: "啊哦", message: "该用户已经存在", preferredStyle: UIAlertControllerStyle.Alert)
            let nilaction = UIAlertAction(title: "好的", style: UIAlertActionStyle.Cancel, handler: nil)
            alertNil.addAction(nilaction)
            presentViewController(alertNil, animated: true, completion: nil)
            
        }
        else if userpass.length < 6 && username.length > 0 {
            let alertLength = UIAlertController(title: "啊哦", message: "密码长度不能小于6位", preferredStyle: UIAlertControllerStyle.Alert)
            let lengthAction = UIAlertAction(title: "👌", style: UIAlertActionStyle.Cancel, handler: nil)
            alertLength.addAction(lengthAction)
            presentViewController(alertLength, animated: true, completion: nil)
            name.clearsOnBeginEditing = true
            password.clearsOnBeginEditing = true
        }
        else {
            self.navigationItem.leftBarButtonItem?.enabled = false
            waitProcess(view, indicatorView: indivoView)
            self.insertBlurView(AllView, style: UIBlurEffectStyle.Light)
            timer = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector:#selector(RegiterViewController.showOK) , userInfo: nil, repeats: false)
        }
    }
    
    func showOK(){
        
        let alert = UIAlertController(title: "Notify", message: "注册成功", preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "👌", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
            self.storgeUser()
        self.performSegueWithIdentifier("returnFirstVC", sender: nil)
            
            self.timer2.invalidate()
        })
        
        timer.invalidate()
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    //键盘消失方法
    
    @IBAction func disapperKeybord(){
        self.password.resignFirstResponder()
        self.name.resignFirstResponder()
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        let frame  = textField.frame
        let offset = frame.origin.y + 180 - (self.view.frame.size.height - 216)
        if offset > 0 {
            self.view.frame = CGRectMake(0.0, -offset, self.view.frame.width, self.view.frame.height)
        } 
    }
    func textFieldDidEndEditing(textField: UITextField) {
        self.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.againPassword.resignFirstResponder()
        self.password.resignFirstResponder()
        self.name.resignFirstResponder()
        if againPassword.text != password.text {
            let alert = UIAlertController(title: "亲", message: "两次输入密码不一致", preferredStyle: UIAlertControllerStyle.Alert)
            let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (finished) -> Void in
                self.againPassword.clearsOnBeginEditing = true
            })
            alert.addAction(action)
            presentViewController(alert, animated: true, completion: nil)
        }
        else if againPassword.text == password.text{
            self.registerButton.enabled = true
        }
        else{
            self.againPassword.resignFirstResponder()
        }
        self.codemind.resignFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == name {
            textField.resignFirstResponder()
            return true
        }
        else if textField == password {
            textField.resignFirstResponder()
            return true
        }
        else if textField == againPassword{
            if againPassword.text != password.text {
                let alert = UIAlertController(title: "亲", message: "两次输入密码不一致", preferredStyle: UIAlertControllerStyle.Alert)
                let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (finished) -> Void in
                    self.againPassword.clearsOnBeginEditing = true
                })
                alert.addAction(action)
                presentViewController(alert, animated: true, completion: nil)
            }
            else{
                self.againPassword.resignFirstResponder()
                return true
            }
        }
        else if textField == codemind {
            textField.resignFirstResponder()
            return true
        }
        return true
    }
    //判断用户是否存在
    func existUser(stringUser:String?) ->Bool{
        let fecthUser = NSFetchRequest(entityName: "Users")
        
        fecthUser.predicate = NSPredicate(format: "name == %@", stringUser!)
        do {
            let tempUser = try managementObjectContext.executeFetchRequest(fecthUser) as! [Users]
            if !tempUser.isEmpty{
                hasExist = true
            }
            else{
                hasExist = false
            }
        }catch{
            fatalError()
        }
        return hasExist
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "returnFirstVC"{
         let firstVC = segue.destinationViewController as! FirstViewController
         firstVC.managementObject = managementObjectContext
        }
    }
    
}
