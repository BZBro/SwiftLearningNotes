//
//  MineViewController.m
//  QuanJianApp
//
//  Created by ZBin on 16/3/12.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import "MineViewController.h"


@interface MineViewController()<UIScrollViewDelegate>{
    NSUInteger count;
}
@property (weak, nonatomic) IBOutlet UIView *sudokuView;

@end
@implementation MineViewController

- (void)viewDidLoad{
    self.view.backgroundColor = BZColor(237, 242, 244);
    [super viewDidLoad];
    [self scrollView];
    
    
    
    
    
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    UIView *view1 = [[UIView alloc] init];
    _guanliView = view1;
    
    UIView *view2 = [[UIView alloc] init];
    _shixiangView = view2;
    
    UIView *view3 = [[UIView alloc] init];
    _yejiView = view3;
    
    UIView *view4 = [[UIView alloc] init];
    _shouruView = view4;
    
    UIView *view5 = [[UIView alloc] init];
    _gouwuView = view5;
    
    UIView *view6 = [[UIView alloc] init];
    _dingdanView = view6;
    UIView *view7 = [[UIView alloc] init];
    _sousuoView = view7;
    
    UIView *view8 = [[UIView alloc] init];
    _shoucangView = view8;
    
    UIView *view9 = [[UIView alloc] init];
    _liuyanView = view9;
    
    //[self allocViews];
    [self layoutSudoKu:_sudokuView view1:_guanliView view2:_shixiangView view3:_yejiView view4:_shouruView view5:_gouwuView view6:_dingdanView view7:_sousuoView view8:_shoucangView view9:_liuyanView];
    [self setBorder];
    [self addButtonAndLabel:_guanliView imageName:@"guke" labelName:@"顾客管理"];
    [self addButtonAndLabel:_shixiangView imageName:@"shixiang" labelName:@"待办事项"];
    [self addButtonAndLabel:_yejiView imageName:@"yeji" labelName:@"业绩查询"];
    [self addButtonAndLabel:_shouruView imageName:@"shouru" labelName:@"收入查询"];
    [self addButtonAndLabel:_gouwuView imageName:@"gouwu" labelName:@"购物车"];
    [self addButtonAndLabel:_dingdanView imageName:@"dingdan" labelName:@"订单查询"];
    [self addButtonAndLabel:_sousuoView imageName:@"sousuo" labelName:@"产品搜索"];
    [self addButtonAndLabel:_shoucangView imageName:@"shoucang" labelName:@"收藏"];
    [self addButtonAndLabel:_liuyanView imageName:@"liuyan" labelName:@"留言"];
}

- (void)addButtonAndLabel:(UIView *)superView imageName:(NSString *)imagename labelName:(NSString *)labelname{
    CGFloat buttonH = superView.width / 3;
    CGFloat buttonW = buttonH * 1.2;
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((superView.width - buttonW) / 2, 20, buttonW, buttonH)];
    [button setImage:[UIImage imageNamed:imagename] forState:UIControlStateNormal];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((superView.width - (buttonW * 1.2)) / 2, (20 + buttonW + 5), buttonW * 1.2, 20)];
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentCenter;
    [label setTintColor:BZColor(214, 214, 214)];
    [label setText:labelname];
    [superView addSubview:button];
    [superView addSubview:label];
}

- (void)layoutSudoKu:(UIView *)superView view1:(UIView *)view1 view2:(UIView *)view2 view3:(UIView *)view3 view4:(UIView *)view4 view5:(UIView *)view5 view6:(UIView *)view6 view7:(UIView *)view7 view8:(UIView *)view8 view9:(UIView *)view9{
    BZLog(superView);
    CGFloat vw = superView.width / 3;
    CGFloat vh = superView.height / 3;
    view1.frame = CGRectMake(0, 0, vw, vh);
    view2.frame = CGRectMake(vw, 0, vw, vh);
    view3.frame = CGRectMake(vw * 2, 0, vw, vh );
    view4.frame = CGRectMake(0, vh, vw, vh );
    view5.frame = CGRectMake(vw, vh, vw, vh );
    view6.frame = CGRectMake(vw * 2, vh, vw, vh );
    view7.frame = CGRectMake(0, vh * 2, vw, vh );
    view8.frame = CGRectMake(vw, vh * 2, vw, vh );
    view9.frame = CGRectMake(vw * 2, vh * 2, vw, vh );
    [superView addSubview:view1];
    [superView addSubview:view2];
    [superView addSubview:view3];
    [superView addSubview:view4];
    [superView addSubview:view5];
    [superView addSubview:view6];
    [superView addSubview:view7];
    [superView addSubview:view8];
    [superView addSubview:view9];
}

- (void)scrollView{
    
    count = 0;
    
    _headScrollView.backgroundColor = [UIColor blackColor];
    //1.Creat a scrollView
//    _headScrollView.frame = CGRectMake(0, 0, 414, 185);
    //[self.view addSubview:_headScrollView];
    float timerInterval = 3;
    [NSTimer scheduledTimerWithTimeInterval:timerInterval target:self selector:@selector(scrollViewAnimation:) userInfo:nil repeats:YES];
    CGFloat scrollH = _headScrollView.height;
    CGFloat scrollW = self.view.width;
    for (int num = 0; num < 4   ; num++) {
        UIButton *button = [[UIButton alloc] init];
        button.width = scrollW;
        button.height = scrollH;
        button.y = 0;
        button.x = num * scrollW;
        [button setImage:[UIImage imageNamed:@"wodeditu"] forState:UIControlStateNormal];
        //button click
        //[button addTarget:self action:@selector(buttondidClick:) forControlEvents:UIControlStateNormal];
        [_headScrollView addSubview:button];
        UIPageControl *pagrController = [[UIPageControl alloc] initWithFrame:CGRectMake(self.headScrollView.width / 2, 86, 100, 100)];
        pagrController.numberOfPages = 4;
        pagrController.backgroundColor = [UIColor clearColor];
        pagrController.currentPageIndicatorTintColor = [UIColor blueColor];
        pagrController.centerX = scrollW * 0.5;
        //pagrController.y = scrollH - 150;
        pagrController.userInteractionEnabled = YES;
        [button addSubview:pagrController];
        pagrController.currentPage = num;
    }
    
    _headScrollView.contentSize = CGSizeMake(4 *scrollW, 0);
    _headScrollView.bounces = NO;
    _headScrollView.showsHorizontalScrollIndicator = NO;
    _headScrollView.delegate = self;
    _headScrollView.pagingEnabled = YES;
 
//    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(27, 160,self.guanliView.width * 3, 72)];
//    //button.backgroundColor = [UIColor blackColor];
//    button.layer.borderWidth = 1;
//    UIColor *tempcolor = BZColor(234, 234, 234);
//    struct CGColor *color = tempcolor.CGColor;
//    button.layer.borderColor = color;
//    button.backgroundColor = BZColor(255, 255, 255);
//    button.titleLabel.font = [UIFont systemFontOfSize:15];
//    [button setTitle:@"欢迎使用，在此登录" forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    
//    button.contentVerticalAlignment = 0;
//    //_loginButton = button;
//    [self.view addSubview:button];
    
}
- (void)scrollViewAnimation:(NSTimer *)timer{
    
    [_headScrollView setContentOffset:CGPointMake(_headScrollView.width * (count + 1), _headScrollView.y ) animated:YES];
    
    
    count++;
    
    if (count == 4) {
        [_headScrollView setContentOffset:CGPointMake(0, _headScrollView.y) animated:YES];
        [timer invalidate];
        //pageControl.currentPage = 0;
        [self scrollView];
    }
    
}
- (void)buttondidClick:(NSString *)imagename{
    //
}



- (void)setBorder{
    UIColor *tempcolor = BZColor(234, 234, 234);
    struct CGColor *color = tempcolor.CGColor;
    self.guanliView.layer.borderWidth = 1;
    self.guanliView.layer.borderColor = color;
    self.guanliView.backgroundColor = [UIColor whiteColor];
    self.shixiangView.layer.borderWidth = 1;
    self.shixiangView.layer.borderColor = color;
    self.shixiangView.backgroundColor = [UIColor whiteColor];
    self.yejiView.layer.borderWidth = 1;
    self.yejiView.layer.borderColor = color;
    self.yejiView.backgroundColor = [UIColor whiteColor];
    self.shouruView.layer.borderWidth = 1;
    self.shouruView.layer.borderColor = color;
    self.shouruView.backgroundColor = [UIColor whiteColor];
    self.gouwuView.layer.borderWidth = 1;
    self.gouwuView.layer.borderColor = color;
    self.gouwuView.backgroundColor = [UIColor whiteColor];
    self.dingdanView.layer.borderWidth = 1;
    self.dingdanView.layer.borderColor = color;
    self.dingdanView.backgroundColor = [UIColor whiteColor];
    self.sousuoView.layer.borderWidth = 1;
    self.sousuoView.layer.borderColor = color;
    self.sousuoView.backgroundColor = [UIColor whiteColor];
    self.shoucangView.layer.borderWidth = 1;
    self.shoucangView.layer.borderColor = color;
    self.shoucangView.backgroundColor = [UIColor whiteColor];
    self.liuyanView.layer.borderWidth = 1;
    self.liuyanView.layer.borderColor = color;
    self.liuyanView.backgroundColor = [UIColor whiteColor];
    
}
#pragma delegate methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
//    double page = scrollView.contentOffset.x / scrollView.width + 1;
//    NSLog(@"%f",page);
//    
//    if (page == 4) {
//        
//        [pageControl setCurrentPage:0];
//        [pageControl updateCurrentPageDisplay];
//    }else{
//        [pageControl setCurrentPage:(int)(page - 0.5)];
//    }
    
}


- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
}
@end
