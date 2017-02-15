//
//  ChangpingTableViewCell.m
//  QuanJianApp
//
//  Created by ZBin on 16/3/18.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import "ChangpingTableViewCell.h"

@implementation ChangpingTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"chanpNewsCell";
    ChangpingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ChangpingTableViewCell" owner:nil options:nil] firstObject];
        
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
