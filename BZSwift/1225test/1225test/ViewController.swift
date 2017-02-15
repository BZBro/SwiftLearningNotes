//
//  ViewController.swift
//  1225test
//
//  Created by ZBin on 15/12/26.
//  Copyright © 2015年 ZBin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var button: UIButton!
    var progressView: UIProgressView!
    
    var timer: NSTimer!
    var remainTime = 100
    
    override func viewDidLoad() {
        
        // 初始化按钮，开始倒计时
        button = UIButton(type: .System) as UIButton
        button.frame = CGRectMake(self.view.frame.width/2 - 50, 50, 100, 50)
        button.setTitle("开始", forState: UIControlState.Normal)
        
        button.addTarget(self, action: "buttonAction", forControlEvents: UIControlEvents.TouchUpInside)
        
        // 初始化 progressView
        progressView = UIProgressView(progressViewStyle: UIProgressViewStyle.Bar)
        progressView.frame = CGRectMake(self.view.frame.width/2 - 50, 200, 100, 100)
        // 设置初始值
        progressView.progress = 1.0
        // 设置进度条颜色
        progressView.progressTintColor = UIColor.blueColor()
        // 设置进度轨迹颜色
        progressView.trackTintColor = UIColor.greenColor()
        // 扩展：可以通过 progressImage、trackImage 属性自定义出个性进度条
        
        self.view.addSubview(button)
        self.view.addSubview(progressView)
    }
    
    /// 响应按钮点击事件，开始倒计时
    func buttonAction() {
        button.enabled = false
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "timerAction", userInfo: nil, repeats:true)
        timer.fire()
    }
    
    // 每秒定时触发
    func timerAction() {
        if(remainTime < 0){
            //倒计时结束
            timer.invalidate()
        } else {
            print("\(remainTime)")
            remainTime = remainTime - 1
            let progressValue = Float(remainTime)/100
            progressView.setProgress(progressValue, animated:true)
        }
    }
    
}

