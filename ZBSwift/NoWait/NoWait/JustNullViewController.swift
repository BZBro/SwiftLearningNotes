//
//  JustNullViewController.swift
//  NoWait
//
//  Created by ZBin on 15/11/16.
//  Copyright © 2015年 ZhangBin. All rights reserved.
//

import UIKit
import CoreData
class JustNullViewController: UIViewController,UIViewControllerTransitioningDelegate {

    @IBOutlet weak var BackImage: UIImageView!
    @IBOutlet weak var Image:UIImageView!
    var myID:NSNumber?
    var timer:NSTimer?
    var managementObjectNull:NSManagedObjectContext!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonit()
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.commonit()
    }
    
    func commonit(){
        self.modalPresentationStyle = UIModalPresentationStyle.Custom
        self.transitioningDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(JustNullViewController.perform), userInfo: nil, repeats: true)
    }
    override func viewWillAppear(animated: Bool) {
        let mode = NSUserDefaults.standardUserDefaults().boolForKey("NIGHT")
        if mode {
            Image.image = UIImage(named: "sun")
            BackImage.image = UIImage(named: "BACKWARM")
        }else{
            Image.image = UIImage(named: "MOON")
            BackImage.image = UIImage(named: "BACKNIGHT")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func perform(){
        performSegueWithIdentifier("BackToNull", sender: nil)
        timer?.invalidate()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "BackToNull"{
            let tabbarController = segue.destinationViewController as! UITabBarController
            
            let navgationController1 = tabbarController.viewControllers![0] as! UINavigationController
            let mainVC = navgationController1.topViewController as! MydailyViewController
            mainVC.managedObjectContext = managementObjectNull
            mainVC.myID = myID
            
            let navgationController2 = tabbarController.viewControllers![1] as! UINavigationController
            
            let editVC = navgationController2.topViewController as! EditViewController
            editVC.managementObjectEdit = managementObjectNull
            editVC.myID = myID
            
        }
    }
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        if presented == self{
            return BackPresention(presentedViewController:presented,presentingViewController:presenting)
        }
        return nil
    }
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if presented == self {
            return NullPresention(isPresenting: true)
        }
        else{
            return nil
        }
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if dismissed == self {
            return NullPresention(isPresenting: false)
        }
        else{
            return nil
        }
    }
}
