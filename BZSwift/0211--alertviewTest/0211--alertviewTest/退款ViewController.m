//
//  退款ViewController.m
//  0211--alertviewTest
//
//  Created by ZBin on 16/2/13.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import "退款ViewController.h"
#import "BZMainPresentationController.h"
@interface __ViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation __ViewController
- (IBAction)提交申请:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.transitioningDelegate  = self;
        
    }
    
    return self;
}


-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.transitioningDelegate  = self;
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.transitioningDelegate = self;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    return [[BZMainPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}


@end
