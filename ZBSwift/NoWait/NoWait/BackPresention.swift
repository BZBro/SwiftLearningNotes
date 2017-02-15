//
//  BackViewPresentionController.swift
//  NoWait
//
//  Created by ZBin on 15/10/8.
//  Copyright © 2015年 ZhangBin. All rights reserved.
//

import UIKit

import UIKit


class BackPresention: UIPresentationController {
    
    lazy var dimmingView:UIView = {
        let view = UIView(frame: self.containerView!.bounds)
        view.backgroundColor = UIColor.clearColor()
        return view
        }()
    override func presentationTransitionWillBegin() {
        self.containerView?.addSubview(dimmingView)
        self.containerView?.addSubview(presentedView()!)
        if let transitionCoordinator = self.presentedViewController.transitionCoordinator(){
            transitionCoordinator.animateAlongsideTransition({ (context) -> Void in
                //模糊方法
                self.insertBlurView(self.dimmingView, style: UIBlurEffectStyle.Light)
                }, completion: nil)
        }
    }
    override func presentationTransitionDidEnd(completed: Bool) {
        if !completed{
            self.dimmingView.removeFromSuperview()
        }
    }
    override func dismissalTransitionWillBegin() {
        self.dimmingView.removeFromSuperview()
    }
    override func dismissalTransitionDidEnd(completed: Bool) {
        if !completed{
            self.dimmingView.removeFromSuperview()
        }
    }
}
