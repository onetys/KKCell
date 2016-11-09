//
//  ViewController.m
//  KKCell
//
//  Created by KING on 2016/10/25.
//  Copyright © 2016年 com.KK. All rights reserved.
//

#import "ViewController.h"

#import "KKCollectionViewCell.h"

#import "KKTextCell.h"

#import "KKImageCell.h"

@interface KKTextModel : NSObject<KKTextCellDataProtocol>

@property(nonatomic, strong)UIColor * textColor;

@property(nonatomic, strong)UIColor * selectedColor;

@property(nonatomic, copy)NSString * placeHolder;

@property(nonatomic, copy)NSString * text;

@property(nonatomic, assign)CGFloat fontSize;

@property(nonatomic, assign)CGFloat selectedFontSize;

@end

@implementation KKTextModel
@end





@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic, strong)UICollectionView * collectionView;
@property(nonatomic, strong)NSArray * sourceData;
@end

@implementation ViewController

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
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self falseData];
    [self.view addSubview:self.collectionView];
}

- (void)falseData
{
    NSArray * texts =  @[@"KKCell",
                         @"KKImageCell",
                         @"KKTextCell"];
#if 0
    self.sourceData = texts;
#else
    
    NSMutableArray * models = [[NSMutableArray alloc]init];
    for (int i = 0; i < 3; i++) {
        KKTextModel * model  = [[KKTextModel alloc]init];
        if ( i == 0) {
            model.text = [texts objectAtIndex:i];
        }else if (i == 1){
            model.placeHolder = texts[i];
        }else{
            model.text = texts[i];
        }
        model.textColor = [UIColor whiteColor];
        model.fontSize = 15;
        model.selectedFontSize = 19;
        [models addObject:model];
    }
    self.sourceData = models;
#endif
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.sourceData.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    KKTextCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:KKTextCellReuseID forIndexPath:indexPath];
    [cell showData:self.sourceData[indexPath.row]];
//    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.contentView.backgroundColor = [UIColor brownColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:[[NSClassFromString(@"KKCollectionViewController") alloc]init] animated:YES];
    }else if (indexPath.row == 2){
        [self.navigationController pushViewController:[[ViewController alloc]init] animated:YES];
    }else{
        [self.navigationController pushViewController:[[NSClassFromString(@"KKImageCollectionViewController") alloc]init] animated:YES];
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake([KKTextCell calculWidthByData:self.sourceData[indexPath.row] andHeight:25] + 30, 35);
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumInteritemSpacing = 20;
        layout.minimumLineSpacing = 20;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.sectionInset = UIEdgeInsetsMake(0 ,10,0,10);
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width, 55) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.alwaysBounceHorizontal = YES;
        [_collectionView registerClass:[KKTextCell class] forCellWithReuseIdentifier:KKTextCellReuseID];
        _collectionView.backgroundColor = [UIColor clearColor];
    }
    return _collectionView;
}

@end
