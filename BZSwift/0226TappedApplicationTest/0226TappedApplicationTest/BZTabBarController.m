//
//  BZTabBarController.m
//  0226TappedApplicationTest
//
//  Created by ZBin on 16/2/26.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import "BZTabBarController.h"

@interface BZTabBarController ()

@end

@implementation BZTabBarController

+(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    tabBarController.selectedIndex = 2;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(tappedLeftButton:)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(tappedRightButton:)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:swipeRight];
}

-(IBAction)tappedRightButton:(id)sender{
    NSUInteger selectedIndex = [self.tabBarController selectedIndex];
    
    NSArray *aryViewController = self.tabBarController.viewControllers;
    
    if (selectedIndex < aryViewController.count - 1) {
        
        UIView *fromView = [self.tabBarController.selectedViewController view];
        
        UIView *toView = [[self.tabBarController.viewControllers objectAtIndex:selectedIndex + 1] view];
        
        
        [UIView transitionFromView:fromView toView:toView duration:0.5 options:UIViewAnimationOptionCurveEaseIn completion:^(BOOL finished) {
            if (finished) {
                [self.tabBarController setSelectedIndex:selectedIndex + 1];
            }
        }];
    }
}
-(IBAction)tappedLeftButton:(id)sender{
    NSUInteger selectedIndex = [self.tabBarController selectedIndex];
    
    
    
    if (selectedIndex > 0) {
        
        UIView *fromView = [self.tabBarController.selectedViewController view];
        
        UIView *toView = [[self.tabBarController.viewControllers objectAtIndex:selectedIndex - 1] view];
        
        [UIView transitionFromView:fromView toView:toView duration:0.5f options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
            
            if (finished) {
                
                [self.tabBarController setSelectedIndex:selectedIndex - 1];
                
            }
            
        }];
        
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
