//
//  KKImageCell.h
//  KKCell
//
//  Created by KING on 2016/10/26.
//  Copyright © 2016年 com.KK. All rights reserved.
//

#import "KKCollectionViewCell.h"

@protocol KKImageCellDataProtocol <KKImageDataProtocol>

@optional
- (UIImage *)kk_placeHolderImage;

@end

/// resuse ID
extern NSString * const KKImageCellReuseID;

/**
 *  Image Cell
 */
@interface KKImageCell : KKCollectionViewCell<KKCellDataProtocol,KKCalculSizeProtocol>

@property(nonatomic, strong, readonly)UIImageView * imageView;

@property(nonatomic, strong, readonly)UIActivityIndicatorView * activityIndicatorView;

@property(nonatomic, assign) BOOL showIndicatorWhenLoadImage; // default is NO

/// set image for imageView
- (void)setImageViewData:(id<KKImageCellDataProtocol>)data;/// overid this method to custom
- (void)layoutImageView; /// overrid this method to custom layout

/// show data
- (void)showData:(id <KKImageCellDataProtocol>)data;

@end
