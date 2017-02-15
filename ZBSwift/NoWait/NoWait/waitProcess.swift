	//
//  waitProcess.swift
//  NoWait
//
//  Created by Admin on 15/9/23.
//  Copyright © 2015年 ZhangBin. All rights reserved.
//
import UIKit
import Foundation
extension NSObject:MAActivityIndicatorViewDelegate {
    
    func waitProcess(view:UIView, indicatorView:MAActivityIndicatorView){
        let indicatorView = MAActivityIndicatorView(frame:view.bounds)
        indicatorView.defaultColor = UIColor.redColor()
        indicatorView.animationDuration    = 2
        indicatorView.numberOfCircles      = 8
        indicatorView.maxRadius            = 78
        indicatorView.delegate = self
        // self.indicatorView1.backgroundColor = UIColor.lightGrayColor()
        indicatorView.startAnimating()
        view.addSubview(indicatorView)
    }

    func activityIndicatorView(activityIndicatorView: MAActivityIndicatorView, circleBackgroundColorAtIndex index: NSInteger) -> UIColor {
        
        let R = CGFloat(arc4random() % 256)/255
        let G = CGFloat(arc4random() % 256)/255
        let B = CGFloat(arc4random() % 256)/255
        
        return UIColor(red: R, green: G, blue: B, alpha: 1)
    }
    func printDocumentPath (){
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        print("\(paths[0])")
    }
    
}
