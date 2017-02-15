//
//  Net.h
//  0321Test
//
//  Created by ZBin on 16/3/24.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@protocol NetDelegate <NSObject>
//代理回调方法
- (void)getDataInfoSuccessFeedBack:(id)feedbackInfo;

- (void)getDataInfoFailFeedBack:(id)failInfo error:(NSError *)error;

@end

@interface Net : NSObject

@property (strong,nonatomic) id <NetDelegate> Netdelegate;

+ (Net *)getInstance;

- (void)SoapExpectData:(NSString *)actionname paramater:(NSString *)paramaterString;

@end
