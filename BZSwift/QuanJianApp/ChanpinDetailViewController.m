//
//  ChanpinDetailViewController.m
//  QuanJianApp
//
//  Created by ZBin on 16/3/19.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import "ChanpinDetailViewController.h"

@interface ChanpinDetailViewController (){
    NSString *valuestring;
}
@property (strong , nonatomic) UIView *zhishiView;

@property (weak, nonatomic) IBOutlet UIImageView *chanpinImageView;

@property (weak, nonatomic) IBOutlet UIView *chanpinCheckView;
@property (weak, nonatomic) IBOutlet UIView *zhishiCheckView;

@end

@implementation ChanpinDetailViewController
- (void)leftButtonClick:(UIBarButtonItem *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
    self.navigationController.navigationBarHidden = NO;
}
- (IBAction)chanpinButton:(UIButton *)sender {
    self.chanpinCheckView.alpha = 1;
    self.zhishiCheckView.alpha = 0;
    [self.zhishiView removeFromSuperview];
}
- (IBAction)zhishiButton:(UIButton *)sender {
    self.chanpinCheckView.alpha = 0;
    self.zhishiCheckView.alpha = 1;
    UIView *tempview = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height)];
    tempview.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:tempview];
    self.zhishiView = tempview;
}
#pragma chanpinDelegate methods

- (void)passchanpinValue:(NSString *)value{
    valuestring = value;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.zhishiCheckView.alpha = 0;
    UIView *segmentView = [[[NSBundle mainBundle] loadNibNamed:@"CustomSegmentView" owner:self options:nil] firstObject];
    self.navigationItem.titleView = segmentView;
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    self.navigationItem.backBarButtonItem.tintColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setHidden:YES];
    [self.tabBarController.tabBar setHidden:YES];
    //[self hideTabBar];
    
    
    
    
    
    BZLog(self.navigationItem);
    
    
//    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(leftButtonClick:)];
//    self.navigationItem.backBarButtonItem.tintColor = [UIColor whiteColor];
    
    

    
    
    [self loadData];
}
- (void)hideTabBar {
    if (self.tabBarController.tabBar.hidden == YES) {
        return;
    }
    UIView *contentView;
    if ( [[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] )
        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    else
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
    contentView.frame = CGRectMake(contentView.bounds.origin.x,  contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height + self.tabBarController.tabBar.frame.size.height);
    self.tabBarController.tabBar.hidden = YES;
    
}
- (void)showTabBar{
        if (self.tabBarController.tabBar.hidden == NO)
        {
            return;
        }
        UIView *contentView;
        if ([[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]])
            
            contentView = [self.tabBarController.view.subviews objectAtIndex:1];
        
        else
            
            contentView = [self.tabBarController.view.subviews objectAtIndex:0];
        contentView.frame = CGRectMake(contentView.bounds.origin.x, contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height - self.tabBarController.tabBar.frame.size.height);
        self.tabBarController.tabBar.hidden = NO;  
        
    }
- (void)loadData{
    [self.chanpinImageView setImage:[UIImage imageNamed:valuestring]];
}



- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:YES];
    self.navigationController.navigationBarHidden = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
