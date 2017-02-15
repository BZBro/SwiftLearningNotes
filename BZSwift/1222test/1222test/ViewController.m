//
//  ViewController.m
//  1222test
//
//  Created by ZBin on 15/12/23.
//  Copyright © 2015年 ZBin. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIGestureRecognizer.h>
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    UISwipeGestureRecognizer* recognizer;
    // handleSwipeFrom 是偵測到手势，所要呼叫的方法
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:selfaction:@selector(handleSwipeFrom)];
    // 不同的 Recognizer 有不同的实体变数
    // 例如 SwipeGesture 可以指定方向
    // 而 TapGesture 則可以指定次數
    recognizer.direction = UISwipeGestureRecognizerDirectionUp
    [self.view addGestureRecognizer:recognizer];
    [recognizer release];
}

- (void)handleSwipeFrom:(UISwipeGestureRecognizer*)recognizer {
    // 触发手勢事件后，在这里作些事情
    // 底下是刪除手势的方法
    [self.view removeGestureRecognizer:recognizer];
}


@end
