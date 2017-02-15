//
//  AppDelegate.swift
//  ShengJianBao
//
//  Created by Mike on 15/12/19.
//  Copyright © 2015年 hyz. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        /*
        NetworkEngine.request(.GET, ShengJianURL.findIndexApply ,parameters:["start":0,"limit":10,"sort":"[{\"property\":\"dateAdd\",\"direction\":\"DESC\"}]","_dc":1451015677046]).responseObject { (response: Response<FindIndexApplyRespone, NSError>) -> Void in
            print(response.result.value?.totalRecord)
        }
        */
        
//        NetworkEngine.GET(ShengJianURL.findIndexApply ,parameters:["start":0,"limit":10,"sort":"[{\"property\":\"dateAdd\",\"direction\":\"DESC\"}]","_dc":NetworkEngine.TimeZoneTime()]).responseObject { (response: Response<FindIndexApplyRespone, NSError>) -> Void in
//            print(response.result.value?.totalRecord)
//        }
        
        self.initCommonStyle()
        IQKeyboardManager.sharedManager().enable = true
        IQKeyboardManager.sharedManager().shouldResignOnTouchOutside = true
        IQKeyboardManager.sharedManager().enableAutoToolbar = false
        
        
        AppContext.user()
        
        TSLocationManager.shareInstance
        
        return true
    }
    
    
    func initCommonStyle(){
        let tintColor = UIColor(red:0.99, green:0.85, blue:0.03, alpha:1)
        
        //tabbar全局样式
        UITabBar.appearance().tintColor = tintColor
        UITabBar.appearance().translucent = false
        
        //全局navigationbar样式
        UINavigationBar.appearance().barTintColor = tintColor
        UINavigationBar.appearance().backgroundColor = tintColor
        UINavigationBar.appearance().translucent = false
        
        let titleStlye = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        UINavigationBar.appearance().titleTextAttributes = titleStlye
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        
        //让返回按钮的字消失
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -100), forBarMetrics: UIBarMetrics.Default)
    }
    
    
    func applicationWillResignActive(application: UIApplication) {

    }

    func applicationDidEnterBackground(application: UIApplication) {

    }

    func applicationWillEnterForeground(application: UIApplication) {

    }

    func applicationDidBecomeActive(application: UIApplication) {

    }

    func applicationWillTerminate(application: UIApplication) {

    }


}

