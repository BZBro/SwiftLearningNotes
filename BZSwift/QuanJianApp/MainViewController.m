//
//  MainViewController.m
//  QuanJianApp
//
//  Created by ZBin on 16/3/12.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import "MainViewController.h"
#import "ZiXunTableViewController.h"
@interface MainViewController ()<UIScrollViewDelegate>{
    NSUInteger count;
    UIImageView *redPoint;
}

@property (weak, nonatomic) IBOutlet UIView *topView;

@property (nonatomic, weak) IBOutlet UIView *referencedView; 

@property (strong,nonatomic) ZiXunTableViewController *zixunTableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *baseViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tiyuRightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *jiaoyuLeftConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tiyuLableLeftConstaint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *jiaoyuLableRightConstraint;
@property (weak, nonatomic) IBOutlet UIButton *dianshitai;
@property (weak, nonatomic) IBOutlet UIButton *dingdan;
@property (weak, nonatomic) IBOutlet UIButton *jiaoyu;
@property (weak, nonatomic) IBOutlet UIButton *tiyu;
//第二列
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cishanWidthConstraint;

//第三列 保健、养生、本草、日用、护理
@property (weak, nonatomic) IBOutlet UIButton *baojianButton;
@property (weak, nonatomic) IBOutlet UIButton *yangshengButton;
@property (weak, nonatomic) IBOutlet UIButton *bencaoButton;
@property (weak, nonatomic) IBOutlet UIButton *riyongButton;
@property (weak, nonatomic) IBOutlet UIButton *huliButton;


@property (weak, nonatomic) IBOutlet UIView *chanpingView1;
@property (weak, nonatomic) IBOutlet UIView *chanpingView2;
@property (weak, nonatomic) IBOutlet UIView *chanpingView3;

//第四列（明星产品）
@property (weak, nonatomic) IBOutlet UIView *mingxingView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *yangshengRightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *riyongLeftConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *middleViewWidthConstraint;
//第五列  资讯新闻


//第六列  下载


@property (weak , nonatomic) IBOutlet UIButton *xiazaiButton;

@end

@implementation MainViewController

#pragma IBAction methods
- (IBAction)baojian:(UIButton *)sender {
    [redPoint removeFromSuperview];
    [self addRedPoint:sender];
}

- (IBAction)yangsheng:(UIButton *)sender {
    [redPoint removeFromSuperview];
    [self addRedPoint:sender];
}

- (IBAction)bencao:(UIButton *)sender {
    [redPoint removeFromSuperview];
    [self addRedPoint:sender];
}

- (IBAction)riyong:(UIButton *)sender {
    [redPoint removeFromSuperview];
    [self addRedPoint:sender];
}

- (IBAction)huli:(UIButton *)sender {
    [redPoint removeFromSuperview];
    [self addRedPoint:sender];
}




#pragma MainView viewmethods
- (void)viewDidLoad{
    [super viewDidLoad];
    
    
    [self baojian:_baojianButton];
    [self.baseScrollView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self headScrollViewDidSrcroll];
    self.baseScrollView.delegate = self;
    self.headScrollView.delegate = self;
    //添加资讯tableView
    [self addZixunTableView];
    
    
    
    UITapGestureRecognizer *singleOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goTop)];
    singleOne.numberOfTouchesRequired = 1;    //触摸点个数，另作：[singleOne setNumberOfTouchesRequired:1];
    singleOne.numberOfTapsRequired = 1;    //点击次数，另作：[singleOne setNumberOfTapsRequired:1];
    
    UITapGestureRecognizer *singleTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goTop)];
    singleTwo.numberOfTouchesRequired = 2;
    singleTwo.numberOfTapsRequired = 1;
    
    UITapGestureRecognizer *doubleOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goTop)];
    doubleOne.numberOfTouchesRequired = 1;
    doubleOne.numberOfTapsRequired = 2;
    
    UITapGestureRecognizer *doubleTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goTop)];
    doubleTwo.numberOfTouchesRequired = 2;
    doubleTwo.numberOfTapsRequired = 2;
    
    [singleOne requireGestureRecognizerToFail:doubleOne]; //防止：双击被单击拦截[singleTwo requireGestureRecognizerToFail:doubleTwo]; //防止：双击被单击拦截
    
    [self.topView addGestureRecognizer:singleOne];
//    [self.topView addGestureRecognizer:singleTwo];
    [self.topView addGestureRecognizer:doubleOne];
    //[self.topView addGestureRecognizer:doubleTwo];

 
    
}

- (void)goTop{
    [self.baseScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
}


- (IBAction)xizaiButtonClicked:(id)sender{
   
    NSLog(@"xiazaiyemian");
}
//  view懒加载
- (ZiXunTableViewController *)zixunTableView{
    if (!_zixunTableView) {
        self.zixunTableView = [[ZiXunTableViewController alloc] init];
        self.zixunTableView.view.frame = CGRectMake(10, _chanpingView1.y + _chanpingView1.height + 105 , (self.view.width - 20) , 272);
    }
    return _zixunTableView;
}



- (void)addZixunTableView{
    
    if (!_zixunTableView) {
       [self zixunTableView];
    }
    _referencedView =  [[[NSBundle mainBundle] loadNibNamed:@"FootViewController" owner:self options:nil]firstObject];
    //[_referencedView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_referencedView setAutoresizingMask:UIViewAutoresizingNone];
    _referencedView.frame = CGRectMake(12, _zixunTableView.view.y + 300, (self.view.width - 24), 60);
    [self.baseView addSubview:_referencedView];
    [self.baseView addSubview:_zixunTableView.view];

//    view.backgroundColor = [UIColor whiteColor];
//    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(350, 16, 50, 20)];
//    [button setImage:[UIImage imageNamed:@"xiazai"] forState:UIControlStateNormal];
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xiazai2"]];
//    imageView.frame = CGRectMake(15, 8, 50, 20);
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(80, 8, 50, 20)];
//    [label setText:@"资料"];
//     UILabel *labelziliao = [[UILabel alloc] initWithFrame:CGRectMake(80, 16, 20, 20)];
//    [label setText:@"图片"];
//    UILabel *labeltupian = [[UILabel alloc] initWithFrame:CGRectMake(90, 16, 20, 20)];
//    [label setText:@"视频"];
//    UILabel *labelshipin = [[UILabel alloc] initWithFrame:CGRectMake(100, 16, 20, 20)];
//    [label setText:@"权健集团 辅助资料"];
//    [view addSubview:labelshipin];
//    [view addSubview:labelziliao];
//    [view addSubview:labeltupian];
//    [view addSubview:imageView];
//    [view addSubview:button];
    
}

#pragma mark other methods

- (void)addRedPoint:(UIView *)superView{
    UIImageView *pointImage = [[UIImageView alloc] initWithFrame:CGRectMake((superView.bounds.size.width / 2 - 5),(superView.bounds.size.height / 2 + 10), 10, 10)];
    pointImage.image = [UIImage imageNamed:@"dian"];
    
    redPoint = pointImage;
    
    [superView addSubview:redPoint];
    
}
- (void)dismissRedpoint:(UIView *)superView{
    
}

- (void)headScrollViewDidSrcroll{
        count = 0;
        _headScrollView.backgroundColor = [UIColor clearColor];
        //1.Creat a scrollView
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
        
        _headScrollView.contentSize = CGSizeMake(4 *scrollW,0);
        _headScrollView.bounces = NO;
        _headScrollView.showsHorizontalScrollIndicator = NO;
        _headScrollView.delegate = self;
        _headScrollView.pagingEnabled = YES;
    
}
- (void)scrollViewAnimation:(NSTimer *)timer{
    
    [_headScrollView setContentOffset:CGPointMake(_headScrollView.width * (count + 1), _headScrollView.y) animated:YES];
    count++;
    if (count == 4) {
        [_headScrollView setContentOffset:CGPointMake(0, _headScrollView.y) animated:YES];
        [timer invalidate];
        [self headScrollViewDidSrcroll];
    }
    
}


- (void)updateViewConstraints{
    [super updateViewConstraints];
    self.baseViewHeight.constant = 1230;
    self.tiyuRightConstraint.constant = (self.view.width - 290) / 4;
    self.jiaoyuLeftConstraint.constant = (self.view.width - 290) / 4;
    self.tiyuLableLeftConstaint.constant = (self.view.width -  345) / 4;
    self.jiaoyuLableRightConstraint.constant = (self.view.width -  345) / 4;
    self.cishanWidthConstraint.constant = (self.view.width - 32) / 2;
    self.yangshengRightConstraint.constant = (self.view.width -  320) / 4;
    self.riyongLeftConstraint.constant = (self.view.width -  320) / 4;
    self.middleViewWidthConstraint.constant = (self.view.width - 42) / 3;
}
#pragma delegate methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
   
}
@end
