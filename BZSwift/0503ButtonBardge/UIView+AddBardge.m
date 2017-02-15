//
//  UIView+AddBardge.m
//  0503ButtonBardge
//
//  Created by 张斌 on 16/5/3.
//  Copyright © 2016年 张斌. All rights reserved.
//

#import "UIView+AddBardge.h"

@implementation UIView (AddBardge)
- (void) addBardge:(int)num superView:(UIView *)superView{
    float SX = superView.bounds.origin.x + superView.frame.size.width;
    float SY = superView.bounds.origin.y;
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(SX - 15, SY - 15, 30, 30)];
    view.layer.cornerRadius = 15;
    view.backgroundColor = [UIColor redColor];
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [label setFont:[UIFont systemFontOfSize:12]];
    [label setTextColor:[UIColor whiteColor]];
    [view addSubview:label];
    [superView addSubview:view];
    [label setText:[NSString stringWithFormat:@"%d",num]];

}
@end
