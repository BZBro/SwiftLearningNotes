//
//  ViewController.h
//  1222test
//
//  Created by ZBin on 15/12/23.
//  Copyright © 2015年 ZBin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,Direction) {
    DirectionUnknow,
    DirectionLeft,
    Directionright
};

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *myimage;


@end

