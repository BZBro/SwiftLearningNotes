//
//  ViewController.m
//  0211--alertviewTest
//
//  Created by ZBin on 16/2/11.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import "ViewController.h"
#define BZNotificationCenter [NSNotificationCenter defaultCenter]
@interface ViewController ()<UIImagePickerControllerDelegate>

@end

@implementation ViewController
- (IBAction)imagePickController:(id)sender {
    [self openAlbum];
    
}


-(void)openAlbum{
    [self openImagePickcontroller:UIImagePickerControllerSourceTypePhotoLibrary];
}
-(void)openImagePickcontroller:(UIImagePickerControllerSourceType *)type
{
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.delegate = self;
    ipc.sourceType = type;
    [self presentViewController:ipc animated:YES completion:nil];
}
-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"info内容为%@",info);
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    [BZNotificationCenter addObserver:self selector:@selector(showSuccess:) name:@"buttontouchupinside" object:self];
//    NSString *string = [NSString stringWithFormat:@"qwerdfsdf%@,wodenianling%d,wodeyouxiang%@",@"sssssss",12,@"451246913@qq.com"];
//    NSLog(@"shuchujieguo ------>  ",string);

#pragma mark UIFontAttributes
//    UIFont *fontAttributes = self.textView.font;
//    NSString *zz = fontAttributes.familyName;
//    NSString *fontname = fontAttributes.fontName;
//    NSString *fontdescriptor = fontAttributes.fontDescriptor;
//    CGFloat pointsize = fontAttributes.pointSize;
//    CGFloat ascender = fontAttributes.ascender;
//    CGFloat descender = fontAttributes.descender;
//    CGFloat capheight = fontAttributes.capHeight;
//    CGFloat xHeight = fontAttributes.xHeight;
//    CGFloat lineHeight = fontAttributes.lineHeight;
//    CGFloat leading = fontAttributes.leading;
//    NSLog(@"family%@",zz);
//    NSLog(@"family%@",fontname);
//
//    NSLog(@"fontAttributes%@",fontAttributes);
//
//    NSLog(@"fontdescriptor%@",fontdescriptor);
//
//    NSLog(@"pointsize%f",pointsize);
//
//    NSLog(@"ascender%f",ascender);
//
//    NSLog(@"descender%f",descender);
//
//    NSLog(@"capheight%f",capheight);
//
//    NSLog(@"xHeight%f",xHeight);
//    NSLog(@"lineHeight%f",lineHeight);
//    NSLog(@"leading%f",leading);

    
    CGPoint point = CGPointMake(50, 50);
    CGRectEdge Edge = 10;
    NSString *string = NSStringFromCGPoint(point);
    if (Edge == CGRectMinXEdge) {
        CGRect dsd = CGRectMake(Edge, Edge, Edge, Edge);
    }
    CGRect dd = CGRectMake(Edge, Edge, Edge, Edge);
    NSString *string2 = NSStringFromCGRect(dd);
    NSLog(@"point->>>%@",string2);
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)zz:(id)sender {
    NSString *string = [NSString stringWithFormat:@"对你爱爱爱不完"];
    NSDictionary *tempDictionary = [NSDictionary dictionaryWithObject:@"qqqqq" forKey:string];
    
    [BZNotificationCenter postNotificationName:@"buttontouchupinside" object:self userInfo:tempDictionary];
    
    
}
   
-(void) showSuccess:(NSNotification *)aNotification{
    NSLog(@"sunccess->>>>>>>%@",aNotification);
}
-(void)dealloc{
    [BZNotificationCenter removeObserver:self];
    [BZNotificationCenter removeObserver:self name:@"buttontouchupinside" object:self];
}
@end
