//
//  TSUIKit.swift
//  ShengJianBao
//
//  Created by welsonla on 16/4/5.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class TSUIKit: NSObject {
    static internal func showProgressWithMessage(message:String,view:UIView,imageName:String?){
        let hud = MBProgressHUD.showHUDAddedTo(view, animated: true)
        hud.mode = .CustomView
        if let img = imageName{
            hud.customView = UIImageView(image: UIImage(named: img))
        }else{
            hud.customView = UIView()
        }
        hud.labelText = message
        hud.square = true
        hud.hide(true, afterDelay: 0.5)
    }
    

}
