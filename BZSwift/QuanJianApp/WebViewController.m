//
//  WebViewController.m
//  QuanJianApp
//
//  Created by ZBin on 16/3/26.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import "WebViewController.h"
#import "InfomationViewController.h"
#import "Net.h"

__strong static WebViewController *web = nil;

__strong static UIWebView *webview;

@interface WebViewController ()<MessageHtmlDelegate,NetDelegate>

@property Net *webnet;

@property (strong , nonatomic) NSString *Getstring;

@property (strong , nonatomic) NSString *paramaterstring;

@property (strong ,nonatomic) NSString *htmlstring;

@end

@implementation WebViewController

+ (WebViewController *)shardWebViewController{
    
    static dispatch_once_t oncetoken;
    
    dispatch_once(&oncetoken, ^{
        //初始化实例
        web = [[WebViewController alloc] init];
    });
    
    return web;
}

- (void)passparamater:(NSString *)Getstring paramaterString:(NSString *)string title:(NSString *)title{
    
    _Getstring = Getstring;
    
    _paramaterstring = string;
    
    [self.navigationItem setTitle:title];
    
    [_webnet SoapExpectData:_Getstring paramater:_paramaterstring];
    
}

- (void)getDataInfoFailFeedBack:(id)failInfo error:(NSError *)error{
    
}

- (void)getDataInfoSuccessFeedBack:(id)feedbackInfo{
    
    
    webview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height)];
    
    NSLog(@"..........%@",feedbackInfo);
    
    [webview loadHTMLString:feedbackInfo baseURL:nil];
    
    [web.view addSubview:webview];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _webnet = [Net getInstance];
    
    _webnet.Netdelegate = self;
    
    [self.tabBarController setHidesBottomBarWhenPushed:YES];
    
    web.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
