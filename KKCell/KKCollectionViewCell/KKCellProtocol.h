//
//  KKCellProtocol.h
//  KKCell
//
//  Created by KING on 2016/10/26.
//  Copyright © 2016年 com.KK. All rights reserved.
//


#ifndef KK_CELL_PROTOCOL
#define KK_CELL_PROTOCOL


#import <Foundation/Foundation.h>

@protocol KKCellDataProtocol <NSObject>

- (void)showData:(id)data;

@end


@protocol KKCalculSizeProtocol <NSObject>

+ (CGFloat)calculWidthByData:(id)data andHeight:(CGFloat)height;

+ (CGFloat)calculHeightByData:(id)data andWidth:(CGFloat)width;

@end


@protocol KKSizeProtocol <NSObject>

- (CGFloat)kk_Width;

- (CGFloat)kk_height;

@end


@protocol KKImageDataProtocol <NSObject>

- (NSURL *)kk_imagePath;

- (UIImage *)kk_image;

- (NSString *)kk_imageLocalPath;

@end

@protocol KKTextDataProtocol <NSObject>

- (NSString *)text;

@optional

- (NSString *)fontName;

- (UIColor *)textColor; // default is black

- (UIColor *)selectedColor; // default is black

- (CGFloat)fontSize; // defualt is 15

- (CGFloat)selectedFontSize; // default is 15

- (CGFloat)lineSpace;

- (CGFloat)textKern;

- (NSTextAlignment)alignment;

- (NSUInteger)numberOfLines;

@end



#endif
