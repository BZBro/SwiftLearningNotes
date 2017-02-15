//
//  TextEditViewController.swift
//  NoWait
//
//  Created by ZBin on 15/11/14.
//  Copyright © 2015年 ZhangBin. All rights reserved.
//

import UIKit

class TextEditViewController: UIViewController,UIViewControllerTransitioningDelegate,UITextViewDelegate {
    
    @IBAction func cancel(){
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBOutlet weak var EditView: UITextView!

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
        EditView.becomeFirstResponder()
    }
    override func viewWillAppear(animated: Bool) {
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.EditView.resignFirstResponder()
    }
    func textViewDidBeginEditing(textView: UITextView) {
        let frame  = textView.frame
        let offset = frame.origin.y + 291 - (self.view.frame.size.height - 216)
        if offset > 0 {
            self.view.frame = CGRectMake(0.0, -offset, self.view.frame.width, self.view.frame.height)
        }
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue == "BackToEditView2"{
        let naVC = segue.destinationViewController as! UINavigationController
            let editVC = naVC.topViewController as! EditViewController
            editVC.tempView.text = EditView.text
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    
}
