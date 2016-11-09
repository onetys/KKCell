//
//  KKImageCell.m
//  KKCell
//
//  Created by KING on 2016/10/26.
//  Copyright © 2016年 com.KK. All rights reserved.
//

#import "KKImageCell.h"

#import <SDWebImage/UIImageView+WebCache.h>

NSString * const KKImageCellReuseID = @"KKImageCellReuseID";

@interface KKImageCell ()
{
    UIImageView * _imageView;
    UIActivityIndicatorView * _activityIndicatorView;
}
@end

@implementation KKImageCell

+ (CGFloat)calculHeightByData:(id)data andWidth:(CGFloat)width
{
    return width * [data kk_height] / [data kk_Width];
}

+ (CGFloat)calculWidthByData:(id)data andHeight:(CGFloat)height
{
    return height * [data kk_Width] / [data kk_height];
}

- (void)setImageViewData:(id<KKImageCellDataProtocol>)data
{
    if ([data isKindOfClass:[UIImage class]]) {
        self.imageView.image = (id)data;
        return;
    }
    
    UIImage * placeHolderImage ;
    if ([data respondsToSelector:@selector(kk_placeHolderImage)] && [data kk_placeHolderImage]) {
        placeHolderImage = [data kk_placeHolderImage];
    }
    
    if ([data kk_image]) {
        self.imageView.image = [data kk_image];
    }else if ([data kk_imageLocalPath]){
        if (self.showIndicatorWhenLoadImage) {
            [self.activityIndicatorView startAnimating];
        }
        self.imageView.image = [UIImage imageWithContentsOfFile:[data kk_imageLocalPath]];
        if (self.showIndicatorWhenLoadImage) {
            [self.activityIndicatorView stopAnimating];
        }
    }else if ([data kk_imagePath]){
        if (self.showIndicatorWhenLoadImage) {
            [self.activityIndicatorView startAnimating];
        }
        __weak typeof(self) weakSelf = self;
        [self.imageView sd_setImageWithURL:[data kk_imagePath] placeholderImage:placeHolderImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if (weakSelf.showIndicatorWhenLoadImage) {
                [weakSelf.activityIndicatorView stopAnimating];
            }
        }];
    }else{
        self.imageView.image = placeHolderImage;
    }
}

-(void)showData:(id<KKImageCellDataProtocol>)data{
    if (!data) {
        self.imageView.image = nil;
        return;
    }
    
    [super showData:data];
    
    [self setImageViewData:data];
}

-  (void)setShowIndicatorWhenLoadImage:(BOOL)showIndicatorWhenLoadImage
{
    if (_showIndicatorWhenLoadImage == showIndicatorWhenLoadImage) {
        return;
    }
    _showIndicatorWhenLoadImage = showIndicatorWhenLoadImage;
    if (showIndicatorWhenLoadImage) {
        [self.contentView addSubview:self.activityIndicatorView];
        [self layoutActivityIndicatorView];
    }else{
        [_activityIndicatorView stopAnimating];
        [_activityIndicatorView removeFromSuperview];
        _activityIndicatorView = nil;
    }
}

- (void)layoutActivityIndicatorView
{
    self.activityIndicatorView.center = CGPointMake(self.contentView.frame.size.width / 2.0,
                                                    self.contentView.frame.size.height / 2.0);
}

- (UIActivityIndicatorView *)activityIndicatorView
{
    if (!_activityIndicatorView) {
        _activityIndicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _activityIndicatorView.hidesWhenStopped = YES;
    }
    return _activityIndicatorView;
}

- (void)commitInit
{
    [super commitInit];
    [self.contentView addSubview:self.imageView];
    [self layoutImageView];
}


- (void)layoutImageView
{
    _imageView.frame = self.contentView.bounds;
    _imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _imageView;
}

@end
