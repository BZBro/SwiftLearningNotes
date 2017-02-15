//
//  InfomationViewController.h
//  QuanJianApp
//
//  Created by ZBin on 16/3/12.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MessageHtmlDelegate 

- (void)passparamater:(NSString *)Getstring paramaterString:(NSString *)string title:(NSString *)title;

@end

@interface InfomationViewController : UIViewController

@property (weak,nonatomic) id <MessageHtmlDelegate> messagedelegate;

@property (weak,nonatomic) IBOutlet UIScrollView *headerScrollView;

@end
