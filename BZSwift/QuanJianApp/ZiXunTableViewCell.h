//
//  ZiXunTableViewCell.h
//  QuanJianApp
//
//  Created by ZBin on 16/3/15.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZiXunTableViewCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView;
@property (weak, nonatomic) IBOutlet UILabel *newsTitle;

@property (weak, nonatomic) IBOutlet UIImageView *newsImage;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
