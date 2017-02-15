//
//  ChanpinCollectionViewCell.h
//  QuanJianApp
//
//  Created by ZBin on 16/3/19.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChanpinCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *chanpinImge;
@property (weak, nonatomic) IBOutlet UILabel *chanpinName;
@property (weak, nonatomic) IBOutlet UILabel *chanpinPrice;

@end
