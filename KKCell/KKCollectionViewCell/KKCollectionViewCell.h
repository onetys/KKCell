//
//  KKCollectionViewCell.h
//  KKCell
//
//  Created by KING on 2016/10/25.
//  Copyright © 2016年 com.KK. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KKCellProtocol.h"

typedef enum : NSUInteger {
    KKCollectionViewCellSeparatorStyleNone,
    KKCollectionViewCellSeparatorStyleLine,
} KKCollectionViewCellSeparatorStyle;

typedef enum : NSUInteger {
    KKCollectionViewCellAccessoryTypeNone,
    KKCollectionViewCellAccessoryDetailDisclosure,
} KKCollectionViewCellAccessoryType;


extern NSString * const KKCollectionViewCellReuseID;

/**
 *  KK Base CollectionView Cell
 */
@interface KKCollectionViewCell : UICollectionViewCell<KKCellDataProtocol>


#pragma mark - public

/// subClass can overrid those methods, but must call super methods
- (void)commitInit;

- (void)showData:(id)data;

#pragma mark - accessoryType

@property(nonatomic, assign)KKCollectionViewCellAccessoryType accessoryType;

@property(nonatomic, strong)UIView * accessoryView;

#pragma mark - background color image

@property(nonatomic, strong)UIColor * backgroundViewColor;

@property(nonatomic, strong)UIColor * selectedBackgroundViewColor;

@property(nonatomic, strong)UIImage * backgroundViewImage;

@property(nonatomic, strong)UIImage * selectedBackgroundViewImage;

- (void)setBackgroundViewColor:(UIColor *)backgroundViewColor contentMode:(UIViewContentMode)contentMode;

- (void)setSelectedBackgroundViewImage:(UIImage *)selectedBackgroundViewImage contentMode:(UIViewContentMode)contentMode;

#pragma mark - separator

@property(nonatomic, assign)UIEdgeInsets separatorInset;

@property(nonatomic, strong)UIColor * separatorColor;

@property(nonatomic, assign)KKCollectionViewCellSeparatorStyle separatorStyle;

@end
