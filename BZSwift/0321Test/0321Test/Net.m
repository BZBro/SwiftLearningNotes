//
//  Net.m
//  0321Test
//
//  Created by ZBin on 16/3/24.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import "Net.h"
#import <AFNetworking.h>
#import "ViewController.h"

__strong static AFURLSessionManager *manager;

__strong static Net *Netinstance = nil;


@interface Net ()<NSXMLParserDelegate>
@property id xmldata;

@property (strong ,nonatomic) NSXMLParser *xmlparser;
//标记当前标签，以索引找到xml文件
@property (nonatomic, strong) NSMutableString *tempString;
//xml解析出来的htmlstring数组
@property (strong ,nonatomic) NSMutableArray *stringarray;
//传递请求参数
@property (strong ,nonatomic) NSString *propertystring;
//返回的htmlstring
@property (strong ,nonatomic) NSString *htmlstring;

@end

@implementation Net

+ (Net *)getInstance{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken,  ^{
        Netinstance = [[Net alloc] init];//初始化实例
        //以下AFURLSessionManager的配置
        
        [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
        }];
        
        [[AFNetworkReachabilityManager sharedManager] startMonitoring];
        
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
        
        manager.reachabilityManager = [AFNetworkReachabilityManager sharedManager];
        
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        
    });
    
    return Netinstance;
}


- (void)SoapExpectData:(NSString *)actionname paramater:(NSString *)paramaterString{
    
    //带参数格式"<id>%d</id>"

    NSString *resultstring = actionname;
    
    _propertystring = [resultstring stringByAppendingString:@"Result"];
    
    NSLog(@"%@",_propertystring);
    
    NSURL *url = [NSURL URLWithString:@"http://app.ziranyixue.com/QJAPP.svc?wsdl"];
    
    NSString *bodyToData = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                            "<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" >\n"
                            "<soap:Body>\n"
                            "<%@ xmlns=\"http://tempuri.org/\">"
                            "%@"
                            "</%@>\n"
                            "</soap:Body>\n"
                            "</soap:Envelope>\n",actionname,paramaterString,actionname];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:0 timeoutInterval:5];
    
    request.HTTPMethod = @"POST";
    
    [request addValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];
    
    NSString *soapactionName = [NSString stringWithFormat:@"http://tempuri.org/IQJAPP/%@",actionname];
    
    [request addValue:soapactionName forHTTPHeaderField:@"SOAPAction"];
    
    [request addValue:[NSString stringWithFormat:@"%lu",(unsigned long)[bodyToData length]]forHTTPHeaderField:@"Content-Length"];
    
    
    NSMutableData *data = [[NSMutableData alloc] initWithData:[bodyToData dataUsingEncoding:NSUTF8StringEncoding]];
    
    [request setHTTPBody:data];
    
    NSLog(@"%@",bodyToData);
    
    
    NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        //NSLog(@"%@",response);
        
        NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        NSLog(@"responseobject----------------->%@",string);
        
        
        if (error) {
            
            [self.Netdelegate getDataInfoFailFeedBack:response error:error];
            
        }else{
            
            _xmldata = responseObject;


            _xmlparser = [[NSXMLParser alloc] initWithData:_xmldata];
            
            _xmlparser.delegate = self;
            
            [_xmlparser parse];
        }
        
        
    }];
    
    
    [task resume];
    
}
#pragma parserDelegate M

- (void)parserDidStartDocument:(NSXMLParser *)parser{
    NSLog(@"Begin parser");
    _tempString = nil;
    _stringarray = nil;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    
    if ([elementName isEqualToString:_propertystring]) {
        if (_stringarray == nil) {
            _stringarray = [[NSMutableArray alloc] init];
        }
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    
    [_stringarray addObject:string];
    
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    //
    
    _tempString = nil;
}

- (void)parserDidEndDocument:(NSXMLParser *)parser{
    
    
    
    
    if (!_tempString) {
        _tempString = [[NSMutableString alloc] init];
    }
    
    
    NSInteger count =  _stringarray.count;
    for (int i = 0; i < count; i++) {
        [_tempString appendString:_stringarray[i]];
        
    }
    
    
//    NSString *dictionaryString = [_tempString substringWithRange:NSMakeRange(1, _tempString.length - 2)];
//    
//    NSData *responsedata = [dictionaryString dataUsingEncoding:NSUTF8StringEncoding];
//    
//    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responsedata options:NSJSONReadingAllowFragments error:nil];
//    
//    _htmlstring = [dic objectForKey:@"Ncontent"];
//    
//    //NSLog(@"%@",dictionaryString);
//    
//    [self.Netdelegate getDataInfoSuccessFeedBack:_htmlstring];
    
}

@end
