//
//  ViewController.m
//  0503ButtonBardge
//
//  Created by 张斌 on 16/5/3.
//  Copyright © 2016年 张斌. All rights reserved.
//

#import "ViewController.h"
#import "UIView+AddBardge.h"
@interface ViewController ()

@end

@implementation ViewController
- (IBAction)button:(UIButton *)sender {
    [sender addBardge:10 superView:sender];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
