//
//  InsertBlurView.swift
//  NoWait
//
//  Created by ZBin on 15/10/9.
//  Copyright © 2015年 ZhangBin. All rights reserved.
//

import UIKit

extension NSObject{
    @available(iOS 8.0, *)
    func insertBlurView(view:UIView,style:UIBlurEffectStyle){
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        view.addSubview(blurEffectView)
    }
}