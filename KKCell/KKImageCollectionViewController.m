//
//  KKImageCollectionViewController.m
//  KKCell
//
//  Created by KING_KE on 2016/11/9.
//  Copyright © 2016年 com.KK. All rights reserved.
//

#import "KKImageCollectionViewController.h"

#import "KKImageCell.h"

NSString * imageName = @"http://pic33.nipic.com/20130916/3420027_192919547000_2.jpg";


@interface KKImageModel : NSObject<KKImageCellDataProtocol>

@property(nonatomic, strong)UIImage * kk_placeHolderImage;

@property(nonatomic, strong)NSURL * kk_imagePath;

@end

@implementation KKImageModel
-(UIImage *)kk_image
{
    return nil;
}
- (NSString *)kk_imageLocalPath
{
    return nil;
}
@end

@interface KKImageCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic, strong)UICollectionView * collectionView;
@property(nonatomic, strong)NSArray * sourceData;
@end

@implementation KKImageCollectionViewController


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self falseData];
    [self.view addSubview:self.collectionView];
}

- (void)falseData
{
    NSMutableArray * models = [[NSMutableArray alloc]init];
    for (int i = 0; i < 3; i++) {
        KKImageModel * model  = [[KKImageModel alloc]init];
        model.kk_imagePath = [NSURL URLWithString:imageName];
        model.kk_placeHolderImage = [UIImage imageNamed:@"2"];
        [models addObject:model];
    }
    self.sourceData = models;
}
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    KKImageCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:KKImageCellReuseID forIndexPath:indexPath];
    cell.showIndicatorWhenLoadImage = YES;
    cell.backgroundViewColor = [UIColor brownColor];
    cell.selectedBackgroundViewColor = [UIColor orangeColor];
    [cell showData:self.sourceData[indexPath.row]];
    return cell;
}


-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumInteritemSpacing = 20;
        layout.minimumLineSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.sectionInset = UIEdgeInsetsMake(0 ,10,0,10);
        layout.itemSize = CGSizeMake(60, 60);
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width, 400) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.alwaysBounceVertical = YES;
        [_collectionView registerClass:[KKImageCell class] forCellWithReuseIdentifier:KKImageCellReuseID];
        _collectionView.backgroundColor = [UIColor clearColor];
    }
    return _collectionView;
}


@end
