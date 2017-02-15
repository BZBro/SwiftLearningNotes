//
//  CustomPresentionAnimation.swift
//  NoWait
//
//  Created by ZBin on 15/10/8.
//  Copyright © 2015年 ZhangBin. All rights reserved.
//

import UIKit

class NullPresention: NSObject,UIViewControllerAnimatedTransitioning {
    
    let isPresenting:Bool
    let duration:NSTimeInterval = 0.5
    
    init(isPresenting:Bool){
        self.isPresenting = isPresenting
        super.init()
    }
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        if isPresenting{
            animatePresentationWithTransitionContext(transitionContext)
        }
        else{
            animateDismissalWithTransitionContext(transitionContext)
        }
    }
    func animatePresentationWithTransitionContext(transitionContext:UIViewControllerContextTransitioning){
        let presentedController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let presentedControllerView = transitionContext.viewForKey(UITransitionContextToViewKey)
        let containerView = transitionContext.containerView()
        
        presentedControllerView?.frame = transitionContext.finalFrameForViewController(presentedController!)
        presentedControllerView?.center.y -= (containerView?.bounds.size.height)!
        containerView?.addSubview(presentedControllerView!)
        UIView.animateWithDuration(duration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.AllowUserInteraction, animations: { () -> Void in
            presentedControllerView!.center.y += (containerView?.bounds.size.height)!
            
            }) { (completed:Bool) -> Void in
                transitionContext.completeTransition(completed)
        }
    }
    func animateDismissalWithTransitionContext(transitionContext:UIViewControllerContextTransitioning){
        
        let presentedControllerView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let containerView = transitionContext.containerView()
        
        // Animate the presented view off the bottom of the view
        UIView.animateWithDuration(self.duration, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: .AllowUserInteraction, animations: {
            
            presentedControllerView.center.y += containerView!.bounds.size.height
            }, completion: {(completed: Bool) -> Void in
                transitionContext.completeTransition(completed)
        })
    }
}
