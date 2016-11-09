//
//  KKCollectionViewController.m
//  KKCell
//
//  Created by KING_KE on 2016/11/9.
//  Copyright © 2016年 com.KK. All rights reserved.
//

#import "KKCollectionViewController.h"

#import "KKCollectionViewCell.h"

@interface KKCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic, strong)UICollectionView * collectionView;
@end

@implementation KKCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

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
    [self.view addSubview:self.collectionView];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    KKCollectionViewCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:KKCollectionViewCellReuseID forIndexPath:indexPath];
    cell.backgroundViewColor = [UIColor brownColor];
    cell.separatorColor = [UIColor blackColor];
    cell.selectedBackgroundViewColor = [UIColor orangeColor];
    cell.accessoryType = KKCollectionViewCellAccessoryDetailDisclosure;
    cell.separatorStyle = KKCollectionViewCellSeparatorStyleLine;
    return cell;
}


-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumInteritemSpacing = 20;
        layout.minimumLineSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.sectionInset = UIEdgeInsetsMake(0 ,10,0,10);
        layout.itemSize = CGSizeMake(self.view.frame.size.width, 44);
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width, 400) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.alwaysBounceVertical = YES;
        [_collectionView registerClass:[KKCollectionViewCell class] forCellWithReuseIdentifier:KKCollectionViewCellReuseID];
        _collectionView.backgroundColor = [UIColor clearColor];
    }
    return _collectionView;
}

@end
