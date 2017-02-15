//
//  ViewController.swift
//  KEYBOARD
//
//  Created by ZBin on 15/11/10.
//  Copyright © 2015年 ZBin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var mytext: UITextField!
    
    func textFieldDidBeginEditing(textField: UITextField) {
        let frame  = textField.frame
        let offset = frame.origin.y + 32 - (self.view.frame.size.height - 258)
        if offset > 0 {
            self.view.frame = CGRectMake(0.0, -offset, self.view.frame.width, self.view.frame.height)
        }
        self.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.mytext.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        self.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mytext.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

