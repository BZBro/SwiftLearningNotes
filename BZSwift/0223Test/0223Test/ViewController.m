//
//  ViewController.m
//  0223Test
//
//  Created by ZBin on 16/2/22.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import "ViewController.h"
#import "UITextView+Extension.h"
@interface ViewController (){
    NSAttributedString *attributedString;
}
@property (weak, nonatomic) IBOutlet UILabel *labelText;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *String = [[NSString alloc] initWithString:self.labelText.text];
    attributedString = [[NSMutableAttributedString alloc] initWithString:String];
    self.textView.text = String;
    NSParagraphStyle *style = [[NSParagraphStyle alloc]init];
    
    [self.textView insertAttributedText:attributedString settingBlock:^(NSMutableAttributedString *attributedText) {
        [attributedText addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, 20)];
    }];
    

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
