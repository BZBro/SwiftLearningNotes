//
//  UIView+Extension.m
//  0226TappedApplicationTest
//
//  Created by ZBin on 16/2/26.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

-(void)addGesture:(UIGestureRecognizer *)gestureRecognizer atView:(UIView *)thisview{
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(tappedLeftButton:)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [thisview addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(tappedRightButton:)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [thisview addGestureRecognizer:swipeRight];
    
}
-(IBAction)tappedRightButton:(UITabBarController *)tabBarController{
    NSUInteger selectedIndex = [tabBarController selectedIndex];
    
    NSArray *aryViewController = tabBarController.viewControllers;
    
    if (selectedIndex < aryViewController.count - 1) {
        
        UIView *fromView = [tabBarController.selectedViewController view];
        
        UIView *toView = [[tabBarController.viewControllers objectAtIndex:selectedIndex + 1] view];
        
        
        [UIView transitionFromView:fromView toView:toView duration:0.5 options:UIViewAnimationOptionCurveEaseIn completion:^(BOOL finished) {
            if (finished) {
                [tabBarController setSelectedIndex:selectedIndex + 1];
            }
        }];
    }
}
-(IBAction)tappedLeftButton:(UITabBarController *)tabBarController{
    NSUInteger selectedIndex = [tabBarController selectedIndex];
    
    
    
    if (selectedIndex > 0) {
        
        UIView *fromView = [tabBarController.selectedViewController view];
        
        UIView *toView = [[tabBarController.viewControllers objectAtIndex:selectedIndex - 1] view];
        
        [UIView transitionFromView:fromView toView:toView duration:0.5f options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
            
            if (finished) {
                
                [tabBarController setSelectedIndex:selectedIndex - 1];
                
            }
            
        }];
        
    }
    
    
}
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

@end
