//
//  ViewController.m
//  0321Test
//
//  Created by ZBin on 16/3/21.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import "Net.h"

@interface ViewController()<NetDelegate,NSXMLParserDelegate>
//添加属性
@property Net *MyNet;



@end

@implementation ViewController


//- (instancetype) init{
//    self = [super init];
//    if (self) {
//        if (!_xmldata) {
//            NSLog(@"null data");
//        }else{
//            _stringarray = [[NSMutableArray alloc] init];
//        }
//        
//    }
//    return self;
//}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    _MyNet = [Net getInstance];
    
    _MyNet.Netdelegate = self;
    
    [_MyNet SoapExpectData:@"Register" paramater:@"\n<name>ceshiaceshi</name>\n<pwd>zhangbing</pwd>\n<nickname>zhangbing<nickname/>"];
    
    //
    
}



#pragma NetDelegate M

- (void)getDataInfoSuccessFeedBack:(id)feedbackInfo{
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    
    [webView loadHTMLString:feedbackInfo baseURL:nil];
    
    webView.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:webView];
}

- (void)getDataInfoFailFeedBack:(id)failInfo error:(NSError *)error{
    
}

- (void)otherMethod{
    // Do any additional setup after loading the view, typically from a nib.
    
    //    QJAPP_GetHotProducts *getproduct = [[QJAPP_GetHotNews alloc] init];
    //
    //
    //
    //    NSURL *url = [NSURL URLWithString:@"httpApp.ziranyixue.com"];
    //    NSData *data = [NSData dataWithContentsOfURL:url];
    //    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //    NSLog(@"%@",string);
    //    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    //    NSLog(@"parser%@",parser);
    //1.创建会话对象
    NSURLSession *session = [NSURLSession sharedSession];
    
    //2.
    NSURL *url = [NSURL URLWithString:@"http://app.ziranyixue.com/QJAPP.svc?wsdl"];
    
    NSString *bodyToData = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                            "<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" >\n"
                            "<soap:Body>\n"
                            "<GetNews xmlns=\"http://tempuri.org/\">\n"
                            "<id>%d</id>\n"
                            "</GetNews>\n"
                            "</soap:Body>\n"
                            "</soap:Envelope>\n",1];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"POST";
    
    [request addValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];
    
    [request addValue:@"http://tempuri.org/IQJAPP/GetNews" forHTTPHeaderField:@"SOAPAction"];
    
    [request addValue:[NSString stringWithFormat:@"%lu",(unsigned long)[bodyToData length]]forHTTPHeaderField:@"Content-Length"];
    
    
    NSMutableData *data = [[NSMutableData alloc] initWithData:[bodyToData dataUsingEncoding:NSUTF8StringEncoding]];
    
    [request setHTTPBody:data];
    
    
    NSURLSessionDataTask *datatask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSString *datastring = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@",response);
        NSLog(@"%@",error);
        NSString *tempstring = [[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding];
        NSLog(@"zheshiHTTPBody%@",tempstring);
        
        NSLog(@"这是数据%@",datastring);
    }];
    
    //[datatask resume];
    
    
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        //NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
