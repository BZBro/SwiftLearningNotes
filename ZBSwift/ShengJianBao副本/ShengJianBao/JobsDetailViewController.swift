//
//  JobsDetailViewController.swift
//  ShengJianBao
//
//  Created by Mike on 16/1/11.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class JobsDetailViewController: UIViewController {

    var indexApply:MTIndexApply?
    var jobinfoController:JobInfoViewController?
    var businessController:TSJobBusinessInfoController?
    
    @IBOutlet weak var leftPanel: UIView!
    @IBOutlet weak var rightPanel: UIView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var widthOflineConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleView.layer.cornerRadius = 5.0
        self.widthOflineConstraint.constant = 0.5
        
        jobinfoController = self.storyboard?.instantiateViewControllerWithIdentifier("JobInfoViewController") as? JobInfoViewController
        jobinfoController?.indexApply = self.indexApply
        leftPanel = jobinfoController!.view
        
        businessController = self.storyboard?.instantiateViewControllerWithIdentifier("TSJobBusinessInfoController") as? TSJobBusinessInfoController
        businessController?.code = indexApply?.userCode
        rightPanel = businessController!.view
        self.view.addSubview(rightPanel)
        self.view.addSubview(leftPanel)
        
        self.view.sendSubviewToBack(rightPanel)
        self.view.bringSubviewToFront(leftPanel)
        print("viewDidLoad")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func handleSwitch(button: UIButton) {
        button.selected = true
        
        print("\(button.tag)")
        
        let otherTag = button.tag==100 ? 101 : 100
        let otherButton = self.titleView.viewWithTag(otherTag) as! UIButton
        otherButton.selected = false
        
        if button.tag == 100 {
            self.view.bringSubviewToFront(leftPanel)
            self.view.sendSubviewToBack(rightPanel)
        }else{
            self.view.bringSubviewToFront(rightPanel)
            self.view.sendSubviewToBack(leftPanel)
        }
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }


}
