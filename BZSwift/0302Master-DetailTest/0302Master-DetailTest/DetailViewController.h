//
//  DetailViewController.h
//  0302Master-DetailTest
//
//  Created by ZBin on 16/3/2.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

