//
//  ZiXunTableViewCell.m
//  QuanJianApp
//
//  Created by ZBin on 16/3/15.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import "ZiXunTableViewCell.h"

@interface ZiXunTableViewCell()


@end

@implementation ZiXunTableViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"zixunCell";
    ZiXunTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ZiXunTableViewCell" owner:nil options:nil] firstObject];
        
    }
    return cell;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
