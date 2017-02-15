//
//  ViewController.swift
//  CircleimageDemo
//
//  Created by ZBin on 15/10/5.
//  Copyright © 2015年 ZBin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = NSTimer()
    
    var currentImg = UIImageView()
    var nextImg = UIImageView()
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var image2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "runFadeAnimation", userInfo: nil, repeats: true)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }

    func runFadeAnimation(){
        
        image.image = UIImage(named: "\(arc4random_uniform(9) + 1).png")
        image2.alpha = 0.0
        UIView.animateWithDuration(2, delay: 0, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            self.image.alpha = 0.5
            self.image2.alpha = 1
            self.image.image = self.image2.image
            self.image2.image = UIImage(named: "\(arc4random_uniform(9) + 1).png")
            
            }) { (finished) -> Void in
                
                
        }
        
    }

}

