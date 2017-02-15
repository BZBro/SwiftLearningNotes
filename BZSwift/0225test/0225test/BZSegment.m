//
//  BZSegment.m
//  0225test
//
//  Created by ZBin on 16/2/25.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import "BZSegment.h"

@implementation BZSegment

+(UISegmentedControl *)initSegentmentControl{
    NSArray *segmentedData = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4", nil];
    UISegmentedControl *segmented = [[UISegmentedControl alloc]initWithItems:segmentedData];
    segmented.frame = CGRectMake(10.0, 20.0, 300.0, 20.0);
    segmented.tintColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.7];
    segmented.selectedSegmentIndex = 0;
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:12],NSFontAttributeName,[UIColor blueColor],NSForegroundColorAttributeName ,nil];
    [segmented setTitleTextAttributes:attributes forState:UIControlStateNormal];
    NSDictionary *highlightedAttributes = [NSDictionary dictionaryWithObject:[UIColor redColor] forKey:NSForegroundColorAttributeName];
    [segmented setTitleTextAttributes:highlightedAttributes forState:UIControlStateHighlighted];
    [segmented addTarget:self action:@selector(doSomthingInSegement) forControlEvents:UIControlEventTouchUpInside];
    return segmented;
}
-(void)doSomthingInSegement{
    NSLog(@"chenggong");
}

@end
