//
//  ViewController.m
//  0225test
//
//  Created by ZBin on 16/2/25.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import "ViewController.h"
#import "BZSegment.h"
@interface ViewController ()

@property(nonatomic,strong)UISegmentedControl *bzSegment;

@end

@implementation ViewController

-(UISegmentedControl *)bzSegment{
    if (!_bzSegment) {
        self.bzSegment = [BZSegment initSegentmentControl];
    }
    return _bzSegment;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.bzSegment];
    NSLog(@"sssssss%@",self.bzSegment);
//    [[[NSBundle mainBundle] loadNibNamed:@"HWEmotionPopView" owner:nil options:nil]lastObject];
//    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
//    [window addSubview:segmentedController];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
