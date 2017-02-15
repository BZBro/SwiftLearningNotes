
//
//  EditViewController.swift
//  NoWait
//
//  Created by ZBin on 15/10/11.
//  Copyright © 2015年 ZhangBin. All rights reserved.
//

import UIKit
import CoreData
class EditViewController: UIViewController,UITextViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate,PickColorViewControllerDelegate {
    
    @IBOutlet weak var FontBackImage: UIImageView!
    @IBOutlet weak var BackGroundImage: UIImageView!
    @IBOutlet weak var FontPickView: UIPickerView!
    @IBAction func addImage(sender: AnyObject) {
        pickMenu()
        print("dddddddddddd")
    }

    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var EditView: UITextView!
    
    var image:UIImage?
    
    var managementObjectEdit:NSManagedObjectContext!
    
    var currentColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    
    var fontSizeArray = ["默认","19","23","27","31","35"]
    
    var FontSize:CGFloat = 17
    
    var mydaily:MyDaily?
    
    var colorA,colorR,colorG,colorB:Float!
    
    var myID:NSNumber?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FontPickView.delegate = self
        EditView.delegate = self
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.getDate()
        self.loadColor(currentColor)
        EditView.textColor = currentColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier  == "ToEditColor" {
            let navCon = segue.destinationViewController as! UINavigationController
            let PickColorVC = navCon.topViewController as! PickColorViewController
            PickColorVC.delegate = self
            PickColorVC.currentSelectedColor = currentColor
        }
        if segue.identifier == "ToMainVC"{
            let tabbarController = segue.destinationViewController as! UITabBarController
            
            let navgationController1 = tabbarController.viewControllers![0] as! UINavigationController
            let mainVC = navgationController1.topViewController as! MydailyViewController
            
            mainVC.myID = myID
            
            mainVC.managedObjectContext = managementObjectEdit
            
            let navgationController2 = tabbarController.viewControllers![1] as! UINavigationController
            
            let editVC = navgationController2.topViewController as! EditViewController
            
            editVC.myID = myID
            
            editVC.managementObjectEdit  = managementObjectEdit
        }
    
    }
    func textViewDidBeginEditing(textView: UITextView) {
        
        if EditView.text == "点我写日记吧！"{
            EditView.text = nil
        }
        self.view.frame = CGRectMake(0.0, -196, self.view.frame.width, self.view.frame.height)
    }
   
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if text == "\n"{
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    func textViewDidEndEditing(textView: UITextView) {
        self.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
    }
    @IBAction func SaveAndFresh(){
            let tempText = EditView.text as NSString
            if let image = image {
                var tempDaily:MyDaily
                let mydaily = NSEntityDescription.insertNewObjectForEntityForName("MyDaily", inManagedObjectContext: self.managementObjectEdit) as! MyDaily
                tempDaily = mydaily
                tempDaily.myDate = self.title
                tempDaily.myFontSize = FontSize
                tempDaily.myID = myID
                tempDaily.month = getMonth()
                if tempText.length == 7 || tempText.length == 0 {
                    tempDaily.myColorA = CGFloat(arc4random_uniform(100) + 150) / 255
                    tempDaily.myColorR = CGFloat(arc4random() % 254) / 255
                    tempDaily.myColorG = CGFloat(arc4random() % 254) / 255
                    tempDaily.myColorB = CGFloat(arc4random() % 254) / 255
                    tempDaily.myDaily = "      不管这一天是快是慢，是喜是悲，她都是真实发生过的一天   I run after time, time ran over from me .   ♬  ♩    ♭ "
                }
                else{
                    tempDaily.myColorA = self.colorA
                    tempDaily.myColorR = self.colorR
                    tempDaily.myColorG = self.colorG
                    tempDaily.myColorB = self.colorB
                    tempDaily.myDaily = self.EditView.text
                }
                if tempDaily.hasPhoto{
                    tempDaily.photoID = MyDaily.nextPhotoID()
                }
                let data = UIImageJPEGRepresentation(image, 1)
                
                do{
                    try data?.writeToFile(tempDaily.photoPath, options: NSDataWritingOptions.DataWritingAtomic)
                    self.showSavaSuc()
                }catch{
                    fatalError()
                }
                do{
                    try managementObjectEdit.save()
                }catch{
                    fatalError()
                }
            }
            else{
                let alert = UIAlertController(title: "", message: "你还没有记录照片哦，要记录吗？", preferredStyle: UIAlertControllerStyle.Alert)
                let action1 = UIAlertAction(title: "要记录", style: UIAlertActionStyle.Default, handler: { _ in
                    
                })
                let action2 = UIAlertAction(title: "不记录", style: UIAlertActionStyle.Default, handler: { _ in
                    var tempDaily:MyDaily
                    let mydaily = NSEntityDescription.insertNewObjectForEntityForName("MyDaily", inManagedObjectContext: self.managementObjectEdit) as! MyDaily
                    tempDaily = mydaily
                    tempDaily.myDate = self.title
                    tempDaily.myFontSize = self.FontSize
                    tempDaily.myID = self.myID
                    tempDaily.month = self.getMonth()
                    tempDaily.photoID = nil
                    
                    if tempText.length == 7 || tempText.length == 0 {
                        tempDaily.myColorA = CGFloat(arc4random_uniform(100) + 150) / 255
                        tempDaily.myColorR = CGFloat(arc4random() % 255) / 255
                        tempDaily.myColorG = CGFloat(arc4random() % 255) / 255
                        tempDaily.myColorB = CGFloat(arc4random() % 255) / 255
                        tempDaily.myDaily = "      不管这一天是快是慢，是喜是悲，她都是真实发生过的一天   I run after time, time ran over from me .   ♬  ♩    ♭ "
                    }
                    else{
                        tempDaily.myColorA = self.colorA
                        tempDaily.myColorR = self.colorR
                        tempDaily.myColorG = self.colorG
                        tempDaily.myColorB = self.colorB
                        tempDaily.myDaily = self.EditView.text
                    }
                    do{
                        try self.managementObjectEdit.save()
                    }catch{
                        fatalError()
                    }
                    
                    self.showSavaSuc()
                })
                alert.addAction(action1)
                alert.addAction(action2)
                presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func getMonth() -> String{
        var tempstring = ""
        let date = NSDate()
        let timeformatter = NSDateFormatter()
        timeformatter.dateFormat = "yyyy/MM/dd"
        let datestring:String = timeformatter.stringFromDate(date)
        var dates:[String] = datestring.componentsSeparatedByString("/")
        tempstring = dates[0] + "-" + dates[1]
        return tempstring
    }
    
    func showSavaSuc(){
        let alert = UIAlertController(title: "", message: "保存成功 ！", preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (finished) -> Void in
            self.performSegueWithIdentifier("ToMainVC", sender: nil)
        }
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    func getDate(){
        let mode = NSUserDefaults.standardUserDefaults().boolForKey("NIGHT")
        if mode {
            UITabBar.appearance().barTintColor = UIColor.whiteColor()
            BackGroundImage.image = UIImage(named: "BACKWARM")
        }else{
            UITabBar.appearance().barTintColor = UIColor.blackColor()
            BackGroundImage.image = UIImage(named: "BACKNIGHT")
        }
        FontBackImage.image = UIImage(named: "BACKWARM")
        let date = NSDate()
        let timerformatter = NSDateFormatter()
        timerformatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString:String = timerformatter.stringFromDate(date)
        self.title = dateString
    }
    func setPaintColor(controller: PickColorViewController, color: UIColor) {
        EditView.textColor = color
        currentColor = color
    }
    func loadColor(currentcolor:UIColor) {
        let colorComponents = CGColorGetComponents(currentcolor.CGColor)
        let red = colorComponents[0]
        let green = colorComponents[1]
        let blue = colorComponents[2]
        let alpha = colorComponents[3]
        colorA = Float(alpha)
        colorB = Float(blue)
        colorG = Float(green)
        colorR = Float(red)
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        if pickerView == FontPickView{
            return 1
        }
        else{
            return 1
        }

    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return fontSizeArray.count
        }
        else
        {
            return 5
        }
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        if component == 0 {
            return fontSizeArray[row]
        }
        else
        {
            return nil
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let tempFontString = "Helvetica"
        if  row == 0{
            FontSize = 17
            self.EditView.font = UIFont(name:tempFontString , size: 17)
            print("\(FontSize)")
        }
            if  row == 1{
                FontSize = 19
               self.EditView.font = UIFont(name:tempFontString , size: 19)
                 print("\(FontSize)")
            }
            if  row == 2{
                FontSize = 23
                self.EditView.font = UIFont(name:tempFontString , size: 23)

                print("\(FontSize)")
            }
            if  row == 3{
                FontSize = 27
                self.EditView.font = UIFont(name:tempFontString , size: 27)

                print("\(FontSize)")
            }
            if  row == 4{
                FontSize = 31
                self.EditView.font = UIFont(name:tempFontString , size: 31)
                print("\(FontSize)")

            }
            if  row == 5{
                FontSize = 35
                self.EditView.font = UIFont(name:tempFontString , size: 35)
                print("\(FontSize)")
            }
    }

   
}

extension EditViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func pickMenu(){
        let alert = UIAlertController(title: "选择图片", message: "从以下应用中选择", preferredStyle: UIAlertControllerStyle.Alert)
        let actionCamera = UIAlertAction(title: "相机", style: UIAlertActionStyle.Default) { _ in
            self.pickImageFromCamera()
        }
        let actionLibrary = UIAlertAction(title: "图库", style: UIAlertActionStyle.Default) { _ in
            self.chooseImageFromLibrary()
        }
        let actionCancel = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(actionCamera)
        alert.addAction(actionLibrary)
        alert.addAction(actionCancel)
        presentViewController(alert,animated:true,completion:nil)
    }
    
    func pickImageFromCamera(){
        let imagePicker = MyImagePickerController()
        
        imagePicker.view.tintColor = UIColor(red: 225/225.0, green: 238/255.0, blue: 136/225.0, alpha: 1)
        
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        imagePicker.allowsEditing = true
        presentViewController(imagePicker,animated: true, completion: nil)
    }
    
    func chooseImageFromLibrary (){
        //创建一个视图拾取器
        let imagePicker = MyImagePickerController()
        
        imagePicker.view.tintColor = UIColor(red: 40/225.0, green: 140/255.0, blue: 255/225.0, alpha: 1)
        //设置视图拾取器的数据源类型
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        imagePicker.delegate = self
        //允许视图拾取器进行编辑
        imagePicker.allowsEditing = true
        //模态出现视图拾取器
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        image = info[UIImagePickerControllerEditedImage] as? UIImage
        showPhotoImage(image)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
    }
    
    func showPhotoImage(image: UIImage?){
        if let image = image {
            photoImageView.image = image
            photoImageView.hidden = false
            
        }
    }
}

