//
//  ViewController.m
//  0112test
//
//  Created by ZBin on 16/1/29.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Extension.h"
#define NewfeatureCount 4

@interface ViewController () <UIScrollViewDelegate>
@property (nonatomic, weak) UIPageControl *pageControl;
@property (nonatomic,weak) UIScrollView *selfscrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.创建一个scrollView：显示所有图片的新特性
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
    self.selfscrollView = scrollView;
    // 2.添加图片到scrollview中
    CGFloat scrollW = scrollView.width;
    CGFloat scrollH = scrollView.height;
    for (int i = 0; i < NewfeatureCount; i++) {
        UIImageView *ImageView = [[UIImageView alloc] init];
        ImageView.width = scrollW;
        ImageView.height = scrollH;
        ImageView.y = 0;
        ImageView.x = i * scrollW;
        NSString *name = [NSString stringWithFormat:@"new_feature_%d",i + 1 ];
        ImageView.image = [UIImage imageNamed:name];
        [scrollView addSubview:ImageView];
        //如果是最后一个imageView，就往里面添加其他内容
        if (i == NewfeatureCount - 1) {
            [self setupLastImageView:ImageView];
        }
    }
    //  3. 设置scrollView 的其他属性
    scrollView.contentSize = CGSizeMake(NewfeatureCount * scrollW, 0);
    //如果想要某个方向上不能滚动，那么这个方向上u 对应的尺寸数值传0
    scrollView.bounces = NO;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self  ;
    //4.添加pageControl：分页，展示目前看的是第几页
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    // UIPageControl就算没有设置尺寸，里面的内容还是照常显示的
}



- (void)setupLastImageView:(UIImageView *)imageView{
    // 开启交互功能
    imageView.userInteractionEnabled = YES;
    
    
}

@end
