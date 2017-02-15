//
//  ViewController.swift
//  1221test
//
//  Created by ZBin on 15/12/23.
//  Copyright © 2015年 ZBin. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    var images:[UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.addimage()
        
    }
    
    func addimage(){
        for var i = 1; i<10; i++ {
            images.append(UIImage(named: "\(i).jpg")!)
        }
        let myimage = UIImageView()
        myimage.animationImages = images
        myimage.frame = CGRectMake(0, 0, 480, 667)
        myimage.animationDuration = 18
        myimage.animationRepeatCount  = 1
        myimage.startAnimating()
        self.view.addSubview(myimage)
        
    }
    



}

