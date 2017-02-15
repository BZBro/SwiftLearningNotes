//
//  BZTabBarController.h
//  0226TappedApplicationTest
//
//  Created by ZBin on 16/2/26.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BZTabBarController : UITabBarController<UITabBarControllerDelegate>
+(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController;
@end
