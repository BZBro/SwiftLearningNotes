//
//  WebViewController.h
//  QuanJianApp
//
//  Created by ZBin on 16/3/26.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfomationViewController.h"
@interface WebViewController : UIViewController<MessageHtmlDelegate>

+ (WebViewController *)shardWebViewController;



@end
