//
//  FirstViewController.m
//  0226TappedApplicationTest
//
//  Created by ZBin on 16/2/26.
//  Copyright © 2016年 BZ. All rights reserved.
//
#define BZNewfeatureCount 4

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "BZTabBarController.h"
@interface FirstViewController ()<UIScrollViewDelegate>{
    NSArray *array;
    UIScrollView *scrollView;
    UIPageControl *pageControl;
    int sum;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(tappedLeftButton:)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(tappedRightButton:)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:swipeRight];
    
    
    
    
    
    
    
    
    
    
    
    sum = 1;
    NSArray *arrayQ = [[NSArray alloc] initWithObjects:@"1", @"2",@"3",@"4",nil];
    
    //1.Creat a scrollView
    UIScrollView *scrollViewAlloc = [[UIScrollView alloc]init];
    scrollViewAlloc.frame = self.view.bounds;
    scrollView = scrollViewAlloc;
    [self.view addSubview:scrollViewAlloc];
    //2.add Images into scrollView
    CGFloat scrollH = scrollViewAlloc.height;
    CGFloat scrollW = scrollViewAlloc.width;
    for (int count = 0; count < BZNewfeatureCount   ; count++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.width = scrollW;
        imageView.height = scrollH;
        imageView.y = 0;
        imageView.x = count * scrollW;
        //display picture
        NSString *name = [NSString stringWithFormat:@"%d.jpg",count + 1];
        imageView.image = [UIImage imageNamed:name];
        [scrollView addSubview:imageView];
        
        if (count == BZNewfeatureCount - 1) {
            [self setupLastImageView:imageView];
        }
    }
    //3. set other properties
    //如果想要在某个方向上不能滚动，对应的这个方向尺寸数值传0即可
    scrollViewAlloc.contentSize = CGSizeMake(BZNewfeatureCount *scrollW, 0);
    scrollViewAlloc.bounces = NO;
    scrollViewAlloc.showsHorizontalScrollIndicator = NO;
    scrollViewAlloc.delegate = self;
    scrollViewAlloc.pagingEnabled = YES;
    
    //4.添加pageController
    UIPageControl *pagrController = [[UIPageControl alloc] init];
    pagrController.numberOfPages = BZNewfeatureCount;
    pagrController.backgroundColor = BZRandomColor;
    pagrController.currentPageIndicatorTintColor = BZRandomColor;
    pagrController.centerX = scrollW * 0.5;
    pagrController.y = scrollH - 150;
    pagrController.userInteractionEnabled = YES;
    [self.view addSubview:pagrController];
    pageControl = pagrController;
    
    }
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    double page = scrollView.contentOffset.x / scrollView.width;
    pageControl.currentPage = (int)(page + 0.5);
    sum +=1;
    self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",sum];
}

- (void)setupLastImageView:(UIImageView *)imageView{
    imageView.userInteractionEnabled = YES;
    //1. shared button
    UIButton *shareBtn = [[UIButton alloc] init];
    [shareBtn setImage:[UIImage imageNamed:@"1.jgp"] forState:UIControlStateNormal];
    [shareBtn setTitle:@"fenxainggeidaxjia" forState:UIControlStateSelected];
    [shareBtn setTitleColor:BZRandomColor forState:UIControlStateNormal];
    shareBtn.backgroundColor  = [UIColor blackColor];
    shareBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    shareBtn.width = 200;
    shareBtn.height = 30;
    shareBtn.centerX = imageView.width * 0.5;
    shareBtn.centerY = imageView.height * 0.65;
    [shareBtn addTarget:self action:@selector(sharedclick) forControlEvents:UIControlEventAllTouchEvents];
    [imageView addSubview:shareBtn];
   
    
}
-(IBAction)tappedRightButton:(id)sender{
    NSUInteger selectedIndex = [self.tabBarController selectedIndex];
    
    NSArray *aryViewController = self.tabBarController.viewControllers;
    
    if (selectedIndex < aryViewController.count - 1) {
        
        UIView *fromView = [self.tabBarController.selectedViewController view];
        
        UIView *toView = [[self.tabBarController.viewControllers objectAtIndex:selectedIndex + 1] view];
        
        
        [UIView transitionFromView:fromView toView:toView duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve completion:^(BOOL finished) {
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

-(void)sharedclick{
    self.tabBarController.selectedIndex = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
