//
//  ForgetViewController.swift
//  NoWait
//
//  Created by ZBin on 15/10/8.
//  Copyright © 2015年 ZhangBin. All rights reserved.
//

import UIKit
import CoreData
class ForgetViewController: UIViewController,UIViewControllerTransitioningDelegate {

    @IBOutlet weak var remind: UIView!
    
    var managementObjectContext : NSManagedObjectContext!
    
    var remindString:String!
    
    @IBOutlet weak var remindLabel: UILabel!
    
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
    @IBAction func cancel(){
         dismissViewControllerAnimated(true, completion: nil)    
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        remindLabel.text = remindString
        
    }
    override func viewWillAppear(animated: Bool) {
        remind.layer.cornerRadius = remind.frame.width / 3
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        if presented == self{
            return BackViewPresentionController(presentedViewController:presented,presentingViewController:presenting)  
        }
        return nil
    }

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if presented == self {
            return CustomPresentionAnimation(isPresenting: true)
        }
        else{
            return nil
        }
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if dismissed == self {
            return CustomPresentionAnimation(isPresenting: false)
        }
        else{
            return nil
        }
    }


}
