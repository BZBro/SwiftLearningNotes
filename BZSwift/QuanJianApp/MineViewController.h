//
//  MineViewController.h
//  QuanJianApp
//
//  Created by ZBin on 16/3/12.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *headScrollView;
@property (strong,nonatomic)IBOutlet UIButton *loginButton;
@property (weak, nonatomic)  UIView *guanliView;
@property (weak, nonatomic)  UIView *shixiangView;
@property (weak, nonatomic)  UIView *yejiView;
@property (weak, nonatomic)  UIView *shouruView;
@property (weak, nonatomic) UIView *gouwuView;
@property (weak, nonatomic)  UIView *dingdanView;
@property (weak, nonatomic)  UIView *sousuoView;
@property (weak, nonatomic) UIView *shoucangView;
@property (weak, nonatomic)  UIView *liuyanView;

@end
