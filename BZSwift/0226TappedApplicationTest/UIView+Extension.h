//
//  UIView+Extension.h
//  0226TappedApplicationTest
//
//  Created by ZBin on 16/2/26.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;
-(void)addGesture:(UIGestureRecognizer *)gestureRecognizer atView:(UIView *)thisview;
-(IBAction)tappedRightButton:(UITabBarController *)tabBarController;
-(IBAction)tappedLeftButton:(UITabBarController *)tabBarController;
@end
