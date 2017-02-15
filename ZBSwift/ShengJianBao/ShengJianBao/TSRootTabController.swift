//
//  TSRootTabController.swift
//  ShengJianBao
//
//  Created by welsonla on 16/1/18.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class TSRootTabController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initTabController()
      
    }
    
    func initTabController(){
        
        //首页
        let homeNav = UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController() as! UINavigationController
        homeNav.tabBarItem.image = UIImage(named: "tab_home")
        homeNav.tabBarItem.selectedImage = UIImage(named: "tab_home_sel")
        
        
        //生煎包
        let shengJianNav = UIStoryboard(name: "TaoShengJian", bundle: nil).instantiateInitialViewController() as!
        UINavigationController
        shengJianNav.tabBarItem.image = UIImage(named: "tab_shengjian")
        shengJianNav.tabBarItem.selectedImage = UIImage(named: "tab_shengjian_sel")
        
        //社区
        let clubNav = UIStoryboard(name: "Club", bundle: nil).instantiateInitialViewController() as! UINavigationController
        clubNav.tabBarItem.image = UIImage(named: "tab_club")
        clubNav.tabBarItem.selectedImage = UIImage(named: "tab_club_sel")
        
        //我的
        let mineNav = UIStoryboard(name: "Mine", bundle: nil).instantiateInitialViewController() as! UINavigationController
        mineNav.tabBarItem.image = UIImage(named: "tab_mine")
        mineNav.tabBarItem.selectedImage = UIImage(named: "tab_mine_sel")
        
        self.viewControllers = [homeNav,shengJianNav,clubNav,mineNav]
        
        self.tabBarController?.delegate = self
        self.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        
        let tabIndex = self.viewControllers?.indexOf(viewController)
        
        if (tabIndex == ((self.viewControllers?.count)!-1))
            && !AppContext.isLogin(){
                AppContext.showLogin(self)
                return false
        }
        
        return true
    }

}
