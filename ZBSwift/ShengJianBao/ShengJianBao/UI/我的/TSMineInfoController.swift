//
//  TSMineInfoController.swift
//  ShengJianBao
//
//  Created by welsonla on 16/1/31.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit
import ObjectMapper

class TSMineInfoController: BaseViewController {

    
    @IBOutlet weak var nicknameField: UITextField!
    @IBOutlet weak var genderMan: UIButton!
    @IBOutlet weak var genderWoman: UIButton!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var bioTextView: UITextView!
    
    
    @IBOutlet weak var heightOfLine1: NSLayoutConstraint!
    @IBOutlet weak var heightOfLine2: NSLayoutConstraint!
    @IBOutlet weak var heightOfLine3: NSLayoutConstraint!
    @IBOutlet weak var heightOfLine4: NSLayoutConstraint!
    @IBOutlet weak var heightOfLine5: NSLayoutConstraint!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup();
       // self.configView(AppContext.user())
        if  let user = AppContext.user() {
            self.loadData(user.userCode!)
        }
    }
    
    func setup(){
        
        heightOfLine1.constant = 0.5
        heightOfLine2.constant = 0.5
        heightOfLine3.constant = 0.5
        heightOfLine4.constant = 0.5
        heightOfLine5.constant = 0.5
        
        bioTextView.layer.cornerRadius = 5.0;
        bioTextView.layer.borderColor = UIColor.lightGrayColor().CGColor
        bioTextView.layer.borderWidth = 0.5
    }
    
    func configView(user:MTUser?){
        if user != nil {
            nicknameField.text = user?.userName;
            ageField.text = "\(user!.userAge!)"
            if let userWeight = user?.userWeight {
                weightField.text = userWeight
            }
            
            if let userHeight = user?.userHeight {
                heightField.text = userHeight
            }
            
            if let userIntroduce = user?.userIntroduce {
                bioTextView.text = userIntroduce
            }
            
        }
        
    }
    
    
    func loadData(userCode:String){
        UserInfoService().getUserInfo(userCode) { (result, data, error) in
            
            let user = MTUser(JSON: data as! Dictionary)
            
            self.configView(user)

        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
