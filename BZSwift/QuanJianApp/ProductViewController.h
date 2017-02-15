//
//  ProductViewController.h
//  QuanJianApp
//
//  Created by ZBin on 16/3/12.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChanpinValue

- (void)passchanpinValue:(NSString *)value;

@end

@interface ProductViewController : UIViewController

@property (retain,nonatomic) id <ChanpinValue> chanpinDelegate;

@end
