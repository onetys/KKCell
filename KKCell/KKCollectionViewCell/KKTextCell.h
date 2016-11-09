//
//  KKTextCell.h
//  KKCell
//
//  Created by KING_KE on 2016/11/8.
//  Copyright © 2016年 com.KK. All rights reserved.
//

#import "KKCollectionViewCell.h"

#import "KKCellProtocol.h"

@protocol KKTextCellDataProtocol <KKTextDataProtocol>

@optional
- (NSString *)placeHolder;

@end

extern NSString * const KKTextCellReuseID;

/**
 *  TextCell
 */
@interface KKTextCell : KKCollectionViewCell<KKCellDataProtocol,KKCalculSizeProtocol>

@property(nonatomic, strong, readonly)UILabel * textLabel;

/// subClass methods

// default if reture a [NSString Class] will set textLabel.text else set textLabel.attributeText
+ (NSAttributedString *)getShowText:(id<KKTextCellDataProtocol>)data selected:(BOOL)selected;/// overrid this method to custom text
- (void)layoutTextLabel; /// overrid this method to custom layout
+ (CGFloat)calculWidthByData:(id<KKTextCellDataProtocol>)data andHeight:(CGFloat)height; /// overrid this method to calcul width
+ (CGFloat)calculHeightByData:(id<KKTextCellDataProtocol>)data andWidth:(CGFloat)width; /// overrid this method to calcul height

/// show data
- (void)showData:(id<KKTextCellDataProtocol>)data;

@end
