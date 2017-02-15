//
//  BZMainPresentationController.m
//  0211--alertviewTest
//
//  Created by ZBin on 16/2/13.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import "BZMainPresentationController.h"

#define frameOffset 100
@interface BZMainPresentationController()

@property(nonatomic,strong)id <UIViewControllerTransitionCoordinator>transitionCoordinator;
@property (nonatomic,retain) UIView *bgView;
@property (nonatomic,retain) UIView *blurView;
@property (nonatomic,strong)UIView *contview;

@end

@implementation BZMainPresentationController

//在呈现过渡即将开始的时候被调用的
//我们在这个方法中把半透明黑色背景 View 加入到 containerView 中，并且做一个 alpha 从0到1的渐变过渡动画
- (void)presentationTransitionWillBegin{
    
    //创建视图
    self.bgView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.blurView = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
    self.blurView.frame = self.containerView.bounds;
    [self.bgView insertSubview:self.blurView atIndex:0];
    
    self.contview = self.containerView;
    [self.contview addSubview:self.presentingViewController.view];
    [self.contview addSubview:self.bgView];
    [self.contview addSubview:self.presentedView];
    
    
    
    // 使用 presentingViewController 的 transitionCoordinator,
    // 背景 bgView 的淡入效果与过渡效果一起执行
    self.bgView.alpha = 0.0;
    self.transitionCoordinator = self.presentingViewController.transitionCoordinator;
    
    [self.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        
//        self.presentingViewController.view.transform = CGAffineTransformScale(self.presentingViewController.view.transform, 0.92, 0.92);
        
//        CGAffineTransform transform = CGAffineTransformIdentity;
        
        
        
        CGFloat m34 = [UIScreen mainScreen].bounds.size.height;
        CGFloat value = - 40;//（控制翻转角度）
        CGPoint point = CGPointMake(0.5, 1);//设定翻转时的中心点，0.5为视图layer的正中
        CATransform3D transfrom = CATransform3DIdentity;
        transfrom.m34 = 1.0 / m34;
        CGFloat radiants = value / 360.0 * 2 * M_PI;
        
        transfrom = CATransform3DRotate(transfrom, radiants, 1.0f, 0.0f, 0.0f);//(后面3个 数字分别代表不同的轴来翻转，本处为x轴)
        
        CATransform3D positionTransform = CATransform3DMakeTranslation(0, 0, 0); //位置移动
        
        CATransform3D combinedTransform = CATransform3DConcat(positionTransform, transfrom); //Concat就是combine的意思
        
        self.presentingViewController.view.layer.anchorPoint = point;
        self.presentingViewController.view.layer.transform = combinedTransform;
        
        self.presentingViewController.view.alpha = 0.7;
        
        self.bgView.alpha = 0.7;
    
        
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {

    }];
    
}

- (BOOL)shouldRemovePresentersView{
    return NO;
}

//在呈现过渡结束时被调用的
//如果呈现没有完成，那就移除背景 View
- (void)presentationTransitionDidEnd:(BOOL)completed{
    if (!completed) {
        [self.bgView removeFromSuperview];
        
    }
}

//-----------以上，就是我们的背景 bgView 的呈现部分-----------


//-----------以下，添加淡出动画并且在它消失后移除它-----------
- (void)dismissalTransitionWillBegin{
    // 与过渡效果一起执行背景 View 的淡出效果
    self.transitionCoordinator = self.presentingViewController.transitionCoordinator;
    [self.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        self.bgView.alpha = 0;
        //self.presentingViewController.view.alpha = 1.0;
        self.presentingViewController.view.transform = CGAffineTransformIdentity;
    } completion:nil];
}

//在退出的过渡结束时被调用的
- (void)dismissalTransitionDidEnd:(BOOL)completed{
    if (completed) {
        [self.bgView removeFromSuperview];
    }
    
    [[[UIApplication sharedApplication]keyWindow]addSubview:self.presentingViewController.view];
}


//-------------------还有最后一个方法-------------------
//如果你不希望被呈现的 View 占据了整个屏幕，可以调整它的frame
//- (CGRect)frameOfPresentedViewInContainerView{
//    CGRect frame1 = self.containerView.bounds;
//    CGRect frame2 = CGRectMake(frame1.origin.x, frame1.origin.y + frameOffset, frame1.size.width,frame1.size.height - frameOffset);
//    
//    return frame2;
//}


//调整presented的圆角效果
- (UIView *)presentedView{
    UIView *pretedView = self.presentedViewController.view;
    pretedView.layer.cornerRadius = 8.0f;
    
    return pretedView;
}

@end
