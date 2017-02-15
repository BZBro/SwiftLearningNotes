//
//  ChangpingTableViewCell.h
//  QuanJianApp
//
//  Created by ZBin on 16/3/18.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangpingTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *newsContext;
+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
