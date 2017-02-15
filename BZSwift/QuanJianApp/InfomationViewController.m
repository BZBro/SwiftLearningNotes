//
//  InfomationViewController.m
//  QuanJianApp
//
//  Created by ZBin on 16/3/12.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import "InfomationViewController.h"
#import "ChanPingZXTableViewController.h"
#import "WebViewController.h"
@interface InfomationViewController ()<UIScrollViewDelegate>{
    NSInteger  count;
}

@property WebViewController *webview;

@property (strong,nonatomic) ChanPingZXTableViewController *chanpingTableView;

@property (weak, nonatomic) IBOutlet UIView *headView;
@property (weak, nonatomic) IBOutlet UIView *newsView;
@property (weak, nonatomic) IBOutlet UIButton *page1Button;
@property (weak, nonatomic) IBOutlet UIButton *page2Button;
@property (weak, nonatomic) IBOutlet UIButton *page3Button;

@end
@implementation InfomationViewController
- (ChanPingZXTableViewController *)chanpingTableView{
    if (!_chanpingTableView) {
        self.chanpingTableView = [[ChanPingZXTableViewController alloc] init];
        self.chanpingTableView.view.frame = CGRectMake(_headView.bounds.origin.x, _headView.bounds.size.width, _headView.bounds.size.width, _chanpingTableView.view.height);
    }
    return _chanpingTableView;
}
#pragma IBAction methods
- (IBAction)jianjie:(id)sender {

    
    //[self.messagedelegate passparamater:@"GetProPageCount" paramaterString:@"\n<id>4</id>\n<num>5</num>\n" title:@"企业简介"];
    
    
    
    
    _webview = [WebViewController shardWebViewController];
    self.messagedelegate = _webview;
    [self.navigationController  pushViewController:_webview animated:YES];
}




- (IBAction)page1:(UIButton *)sender {
    _page1Button.userInteractionEnabled = NO;
    _page2Button.userInteractionEnabled = YES;
    _page3Button.userInteractionEnabled = YES;
    [_page1Button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_page2Button setTitleColor:BZColor(170, 170, 170) forState:UIControlStateNormal];
    [_page3Button setTitleColor:BZColor(170, 170, 170) forState:UIControlStateNormal];
    [_chanpingTableView removeFromParentViewController];
    [[[NSBundle mainBundle] loadNibNamed:@"QiYeViewController" owner:self options:nil] firstObject];
    //[_newsView setAutoresizingMask:UIViewAutoresizingNone];
    [self addnewView:_newsView toview:self.view];
    
}
- (IBAction)page2:(UIButton *)sender {
    
    _page1Button.userInteractionEnabled = YES;
    _page2Button.userInteractionEnabled = NO;
    _page3Button.userInteractionEnabled = YES;
    [_page2Button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_page1Button setTitleColor:BZColor(170, 170, 170) forState:UIControlStateNormal];
    [_page3Button setTitleColor:BZColor(170, 170, 170) forState:UIControlStateNormal];
    [_newsView removeFromSuperview];
    if (!_chanpingTableView) {
        [self chanpingTableView];
    }
    [self addnewView:_chanpingTableView.view toview:self.view];
    
}

- (IBAction)page3:(UIButton *)sender {
    
    _page1Button.userInteractionEnabled = YES;
    _page2Button.userInteractionEnabled = YES;
    _page3Button.userInteractionEnabled = NO;
    [_page3Button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_page1Button setTitleColor:BZColor(170, 170, 170) forState:UIControlStateNormal];
    [_page2Button setTitleColor:BZColor(170, 170, 170) forState:UIControlStateNormal];
    [_newsView removeFromSuperview];
    [_chanpingTableView removeFromParentViewController];
}
- (IBAction)leftBarButton:(id)sender {
    [self.tabBarController setSelectedIndex:0];
}

#pragma Delegate M

#pragma view methods
- (void)viewDidLoad{
    [super viewDidLoad];    
    
    if (self) {
        self.navigationController.navigationBar.alpha = 0.8;
        self.navigationController.navigationBar.translucent = YES;
    }
    _page1Button.userInteractionEnabled = NO;
    [_page1Button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    _newsView = [[[NSBundle mainBundle] loadNibNamed:@"QiYeViewController" owner:self options:nil] firstObject];
    CGFloat _newsH = (self.view.height - 250 - 113);
    _newsView.frame = CGRectMake(12, (_headView.y + _headView.height + 8),self.view.width - 24, _newsH);
    NSLog(@"%f",self.view.height);
    [self.view addSubview:_newsView];
    [self.headerScrollView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_headerScrollView setAutoresizingMask:UIViewAutoresizingNone];
    _headerScrollView.backgroundColor = [ UIColor blackColor];
    [self headScrollViewDidSrcroll];
}
- (void)addnewView:(UIView *)subview toview:(UIView *)superview{
    
    subview.frame = CGRectMake(12, (_headView.y + _headView.height + 8),self.view.width - 24, (self.view.height - 250));
    [superview addSubview:subview];
}

- (void)headScrollViewDidSrcroll{
    count = 0;
    _headerScrollView.backgroundColor = [UIColor clearColor];
    //1.Creat a scrollView
    float timerInterval = 3;
    CGFloat scrollH = _headerScrollView.height;
    CGFloat scrollW = self.view.width;
    _headerScrollView.contentSize = CGSizeMake(4 *scrollW,0);
    _headerScrollView.bounces = NO;
    _headerScrollView.showsHorizontalScrollIndicator = NO;
    _headerScrollView.delegate = self;
    _headerScrollView.pagingEnabled = YES;
    [NSTimer scheduledTimerWithTimeInterval:timerInterval target:self selector:@selector(scrollViewAnimation:) userInfo:nil repeats:YES];
    
    for (int num = 0; num < 4   ; num++) {
        UIButton *button = [[UIButton alloc] init];
        button.width = scrollW;
        button.height = scrollH;
        button.y = 0;
        button.x = num * scrollW;
        [button setImage:[UIImage imageNamed:@"zixunditu"] forState:UIControlStateNormal];
        //button click
        //[button addTarget:self action:@selector(buttondidClick:) forControlEvents:UIControlStateNormal];
        [_headerScrollView addSubview:button];
        UIPageControl *pagrController = [[UIPageControl alloc] initWithFrame:CGRectMake(self.headerScrollView.width / 2, 86, 100, 100)];
        pagrController.numberOfPages = 4;
        pagrController.backgroundColor = [UIColor clearColor];
        pagrController.currentPageIndicatorTintColor = [UIColor blueColor];
        pagrController.centerX = scrollW * 0.5;
        //pagrController.y = scrollH - 150;
        pagrController.userInteractionEnabled = YES;
        [button addSubview:pagrController];
        pagrController.currentPage = num;
    }
    
    
    
}
- (void)scrollViewAnimation:(NSTimer *)timer{
    
    [_headerScrollView setContentOffset:CGPointMake(_headerScrollView.width * (count + 1), _headerScrollView.y ) animated:YES];
    count++;
    if (count == 4) {
        [_headerScrollView setContentOffset:CGPointMake(0, _headerScrollView.y) animated:YES];
        [timer invalidate];
        [self headScrollViewDidSrcroll];
    }
    
}

@end
