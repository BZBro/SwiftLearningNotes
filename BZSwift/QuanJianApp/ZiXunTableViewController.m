//
//  ZiXunTableViewController.m
//  QuanJianApp
//
//  Created by ZBin on 16/3/15.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import "ZiXunTableViewController.h"
#import "ZiXunTableViewCell.h"
#import "ZiXunTableHeaderCell.h"
@interface ZiXunTableViewController ()
@property (strong ,nonatomic) NSArray *array;
@end

@implementation ZiXunTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSArray *temoarray = [[NSArray alloc] initWithObjects:@"zixun1",@"zixun2",@"zixun3", nil];
    self.array = temoarray;
    
    [self.tableView setAutoresizingMask:UIViewAutoresizingNone];
    self.tableView.layer.borderWidth = 2;
    UIColor *tempcolor = BZColor(234, 234, 234);
    struct CGColor *color = tempcolor.CGColor;
    self.tableView.layer.borderColor = color;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 38;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    static NSString * identy = @"zixunHeader";
    
    ZiXunTableHeaderCell * hf = [tableView dequeueReusableCellWithIdentifier:identy];
    
    if (!hf) {
        hf = [[[NSBundle mainBundle] loadNibNamed:@"ZiXunTableHeaderCell" owner:nil options:nil] firstObject];
    }
    
    return hf;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZiXunTableViewCell *cell = [ZiXunTableViewCell cellWithTableView:tableView];
    NSString *string = @"kuaiaaaaaaaa";
    cell.newsTitle.text = string;
    cell.timeLabel.tintColor = [UIColor blackColor];
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    dateformatter.dateFormat = @"yyyy-MM-dd";
    NSString *date = [dateformatter stringFromDate:[NSDate date]];
    cell.timeLabel.text = date;
    NSString *imageName = self.array[indexPath.row];
    cell.newsImage.image = [UIImage imageNamed:imageName];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 78;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
