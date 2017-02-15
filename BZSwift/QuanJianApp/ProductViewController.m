//
//  ProductViewController.m
//  QuanJianApp
//
//  Created by ZBin on 16/3/12.
//  Copyright © 2016年 BZ. All rights reserved.
//

#import "ProductViewController.h"
#import "ChanpinCollectionViewCell.h"
#import "ChanpinDetailViewController.h"
@interface ProductViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>{
    NSInteger  count;
    NSArray *chanpinArray;
}



@property (weak, nonatomic) IBOutlet UIScrollView *headerScrollView;
@property (strong ,nonatomic) UICollectionView *collectionView;




@property (weak, nonatomic) IBOutlet UIView *headView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *yangshengRightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *riyongLeftConstraint;
@property (weak, nonatomic) IBOutlet UIButton *baojianButton;
@property (weak, nonatomic) IBOutlet UIButton *yangshengButton;
@property (weak, nonatomic) IBOutlet UIButton *riyongButton;
@property (weak, nonatomic) IBOutlet UIButton *huliButton;
@property (weak, nonatomic) IBOutlet UIButton *bencaoButton;

@end
@implementation ProductViewController

- (IBAction)backMain:(id)sender {
    [self.tabBarController setSelectedIndex:0];
}
#pragma IBAction methods
- (IBAction)baojianButtonClick:(UIButton *)sender {
    [self dyeColor:sender other1:_yangshengButton other2:_bencaoButton other3:_riyongButton other4:_huliButton];
}
- (IBAction)yangshengButtonClick:(UIButton *)sender {
    [self dyeColor:sender other1:_baojianButton other2:_bencaoButton other3:_riyongButton other4:_huliButton];
}
- (IBAction)riyongButtonClick:(UIButton *)sender {
    [self dyeColor:sender other1:_yangshengButton other2:_bencaoButton other3:_baojianButton other4:_huliButton];
}
- (IBAction)huliButtonClick:(UIButton *)sender {
    [self dyeColor:sender other1:_yangshengButton other2:_bencaoButton other3:_riyongButton other4:_baojianButton];
}
- (IBAction)bencaoButtonClick:(UIButton *)sender {
    [self dyeColor:sender other1:_yangshengButton other2:_baojianButton other3:_riyongButton other4:_huliButton];
}
#pragma custom methods

- (void)dyeColor:(UIButton *)button other1:(UIButton *)other1 other2:(UIButton *)other2 other3:(UIButton *)other3 other4:(UIButton *)other4 {
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [other1 setTitleColor:BZColor(170, 170, 170) forState:UIControlStateNormal];
    [other2 setTitleColor:BZColor(170, 170, 170) forState:UIControlStateNormal];
    [other3 setTitleColor:BZColor(170, 170, 170) forState:UIControlStateNormal];
    [other4 setTitleColor:BZColor(170, 170, 170) forState:UIControlStateNormal];
    button.userInteractionEnabled = NO;
    other1.userInteractionEnabled = YES;
    other2.userInteractionEnabled = YES;
    other3.userInteractionEnabled = YES;
    other4.userInteractionEnabled = YES;
}


#pragma ViewMethods

- (void)viewDidLoad{
    
    NSArray *array = [[NSArray alloc] initWithObjects:@"shangping1",@"shangping1",@"shangping2",@"shangping3",@"shangping4",@"shangping5",@"shangping6", nil];
    
//    NSMutableArray *array = [[NSMutableArray alloc] init];
//    for (int i = 0; i < 6; i++) {
//        NSString *string = [NSString stringWithFormat:@"shangping%d",i + 1];
//        [array addObject:string];
//    }
    
//    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
//    self.navigationItem.backBarButtonItem.tintColor = [UIColor whiteColor];
    
//    UIBarButtonItem *item = [[UIBarButtonItem alloc] init];
//    
//    UIImage* image = [UIImage imageNamed:@"b"];
//    
//    [item setBackButtonBackgroundImage:[image resizableImageWithCapInsets:UIEdgeInsetsMake(0, image.size.width, 0,0)] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//    
//    [item setBackButtonTitlePositionAdjustment:UIOffsetMake(-400.f, 0) forBarMetrics:UIBarMetricsDefault];
//    NSLog(@"%f",-400.f);
//    
    
    //self.navigationItem.backBarButtonItem = item;
    
    chanpinArray = array;
  
    self.view.backgroundColor = BZColor(237, 242, 244);
    _headView.backgroundColor = [UIColor whiteColor];
    [self addCollection];
    [self headScrollViewDidSrcroll];
    [self baojianButtonClick:_baojianButton];
    
}

- (void)updateViewConstraints{
    [super updateViewConstraints];
    self.yangshengRightConstraint.constant = (self.view.width - 264) / 4;
    self.riyongLeftConstraint.constant = (self.view.width - 264) / 4;
    
}

- (void)addCollection{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    layout.minimumInteritemSpacing = 9;
    layout.minimumLineSpacing = 9;
    UICollectionView *tempCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(12, (_headView.y + _headView.height + 8),self.view.width - 24, (self.view.height - 250 - 113)) collectionViewLayout:layout];
    NSLog(@"%f",tempCollectionView.height);
    tempCollectionView.delegate = self;
    tempCollectionView.dataSource = self;
    tempCollectionView.backgroundColor = BZColor(237, 242, 244);
    tempCollectionView.collectionViewLayout = layout;
    [tempCollectionView registerNib:[UINib nibWithNibName:@"ChanpinCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"chanpingCell"];
    [self.view addSubview:tempCollectionView];
    self.collectionView = tempCollectionView;
}
- (void)headScrollViewDidSrcroll{
    count = 0;
    _headerScrollView.backgroundColor = [UIColor clearColor];
    //1.Creat a scrollView
    float timerInterval = 3;
    CGFloat scrollH = _headerScrollView.height;
    CGFloat scrollW = self.view.width;
    _headerScrollView.contentSize = CGSizeMake(4 *scrollW,0);
    _headerScrollView.bounces = NO;
    _headerScrollView.showsHorizontalScrollIndicator = NO;
    _headerScrollView.delegate = self;
    _headerScrollView.pagingEnabled = YES;
    [NSTimer scheduledTimerWithTimeInterval:timerInterval target:self selector:@selector(scrollViewAnimation:) userInfo:nil repeats:YES];
    
    for (int num = 0; num < 4   ; num++) {
        UIButton *button = [[UIButton alloc] init];
        button.width = scrollW;
        button.height = scrollH;
        button.y = 0;
        button.x = num * scrollW;
        [button setImage:[UIImage imageNamed:@"chanpingditu"] forState:UIControlStateNormal];
        //button click
        //[button addTarget:self action:@selector(buttondidClick:) forControlEvents:UIControlStateNormal];
        [_headerScrollView addSubview:button];
        UIPageControl *pagrController = [[UIPageControl alloc] initWithFrame:CGRectMake(self.headerScrollView.width / 2, 86, 100, 100)];
        pagrController.numberOfPages = 4;
        pagrController.backgroundColor = [UIColor clearColor];
        pagrController.currentPageIndicatorTintColor = [UIColor blueColor];
        pagrController.centerX = scrollW * 0.5;
        //pagrController.y = scrollH - 150;
        pagrController.userInteractionEnabled = YES;
        [button addSubview:pagrController];
        pagrController.currentPage = num;
    }
}
- (void)scrollViewAnimation:(NSTimer *)timer{
    
    [_headerScrollView setContentOffset:CGPointMake(_headerScrollView.width * (count + 1), _headerScrollView.y) animated:YES];
    count++;
    if (count == 4) {
        [_headerScrollView setContentOffset:CGPointMake(0, _headerScrollView.y) animated:YES];
        [timer invalidate];
        [self headScrollViewDidSrcroll];
    }
    
}
#pragma Deleate methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 9;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identy = @"chanpingCell";
    ChanpinCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identy forIndexPath:indexPath];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ChanpinCollectionViewCell" owner:nil options:nil] firstObject];
    }
    cell.layer.borderWidth = 1;
    UIColor *tempcolor = BZColor(234, 234, 234);
    struct CGColor *color = tempcolor.CGColor;
    cell.layer.borderColor = color;
    cell.backgroundColor = [UIColor whiteColor];

    [cell.contentView addSubview:cell.chanpinImge];

    if (indexPath.row < 6) {
        [cell.chanpinImge setImage:[UIImage imageNamed:chanpinArray[indexPath.row]]];     
    }

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ChanpinDetailViewController *view =[[ChanpinDetailViewController alloc] init];
    self.chanpinDelegate = view;
    [self.chanpinDelegate passchanpinValue:chanpinArray[indexPath.row]];
    [self.navigationController pushViewController:view animated:YES];

//    [self presentViewController:view animated:YES completion:^{
//        //
//    } ];

}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((self.view.width - 42) / 3 ,160);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 9, 0);
}

@end
