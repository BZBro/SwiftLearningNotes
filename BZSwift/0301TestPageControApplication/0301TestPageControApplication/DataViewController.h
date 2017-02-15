//
//  DataViewController.h
//  0301TestPageControApplication
//
//  Created by ZBin on 16/3/2.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) id dataObject;
@property (weak, nonatomic) IBOutlet UITextView *Text;

@end

