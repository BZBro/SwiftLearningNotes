//
//  FootViewController.m
//  QuanJianApp
//
//  Created by ZBin on 16/3/17.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import "FootViewController.h"

@interface FootViewController ()
@property (weak, nonatomic) IBOutlet UILabel *ziliao;
@property (weak, nonatomic) IBOutlet UILabel *tupian;
@property (weak, nonatomic) IBOutlet UILabel *shipin;

@end

@implementation FootViewController


- (void)drawRect:(CGRect)rect {
    
    UIColor *tempcolor = BZColor(234, 234, 234);
    struct CGColor *color = tempcolor.CGColor;
    _ziliao.layer.borderWidth = 1;
    _ziliao.layer.borderColor = color;
    _tupian.layer.borderWidth = 1;
    _tupian.layer.borderColor = color;
    _shipin.layer.borderWidth = 1;
    _shipin.layer.borderColor = color;
}


@end
