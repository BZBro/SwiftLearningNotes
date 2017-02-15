//
//  LookupViewController.swift
//  NoWait
//
//  Created by ZBin on 15/11/7.
//  Copyright © 2015年 ZhangBin. All rights reserved.
//

import UIKit

class LookupViewController: UIViewController {

    @IBOutlet weak var Image: UIImageView!
    
    @IBOutlet weak var BackgroundImage: UIImageView!
    
    @IBOutlet weak var Textfiled: UITextView!
    
    var currentDaily:MyDaily?
    
    var myID:NSNumber?
    
    @IBAction func cancel(){
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Textfiled.editable = false
        self.getMassage()
        if let daily = currentDaily{
            title = daily.myDate
            let tempsize = CGFloat((currentDaily?.myFontSize)!)
            Textfiled.text = daily.myDaily
            Textfiled.font = UIFont(name: "Helvetica", size: tempsize)
            if daily.hasPhoto {
                if let image = daily.photoImage{
                    showPhotoImage(image)
                }
            }
            else if daily.photoID == nil {
                if let image = daily.tempImage {
                    showPhotoImage(image)
                }
            }
        }
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let mode = NSUserDefaults.standardUserDefaults().boolForKey("NIGHT")
        if mode {
            UITabBar.appearance().barTintColor = UIColor.whiteColor()
            BackgroundImage.image = UIImage(named: "BACKWARM")
        }else{
            UITabBar.appearance().barTintColor = UIColor.blackColor()
            BackgroundImage.image = UIImage(named: "BACKNIGHT")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func getMassage(){
        let red = CGFloat((currentDaily?.myColorR)!)
        let green = CGFloat((currentDaily?.myColorG)!)
        let blue = CGFloat((currentDaily?.myColorB)!)
        let alpha = CGFloat((currentDaily?.myColorA)!)
        
        Textfiled.textColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    func showPhotoImage(image:UIImage?){
        if let image = image{
            Image.image = image
        }
    }
}
