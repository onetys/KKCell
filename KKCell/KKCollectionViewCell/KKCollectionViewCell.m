//
//  KKCollectionViewCell.m
//  KKCell
//
//  Created by KING on 2016/10/25.
//  Copyright © 2016年 com.KK. All rights reserved.
//

#import "KKCollectionViewCell.h"

NSString * const KKCollectionViewCellReuseID = @"KKCollectionViewCellReuseID";

@interface KKCollectionViewCell ()

#pragma mark - separator

@property(nonatomic, strong)UIView * separatorView;


#pragma mark - background color image

@property(nonatomic, strong)UIImageView * kk_backgroundView;

@property(nonatomic, strong)UIImageView * kk_selectedBackgroundView;

@end

@implementation KKCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commitInit];
    }
    return self;
}

- (void)commitInit
{
    // separator
    _separatorColor = [UIColor grayColor];
    _separatorInset = UIEdgeInsetsMake(self.frame.size.height - 1.0f, 30, 0, 0);
}

- (void)showData:(id)data{}

#pragma mark - accessory

#define KKCOLLAccessoryRightMargin 30
#define KKCOLLAccessoryHeight 25
#define KKCOLLAccessoryWidth 25

- (void)setAccessoryType:(KKCollectionViewCellAccessoryType)accessoryType
{
    _accessoryType = accessoryType;
    if (accessoryType == KKCollectionViewCellAccessoryTypeNone) {
        [_accessoryView removeFromSuperview];
        _accessoryView = nil;
    }else if(accessoryType == KKCollectionViewCellAccessoryDetailDisclosure){
        if ([_accessoryView isKindOfClass:[UIButton class]] && ((UIButton *)_accessoryView).buttonType == UIButtonTypeDetailDisclosure) {
            return;
        }
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        self.accessoryView = btn;
    }
}

- (void)setAccessoryView:(UIView *)accessoryView
{
    [_accessoryView removeFromSuperview];
    _accessoryView = nil;
    _accessoryView = accessoryView;
    _accessoryView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin;
    _accessoryView.frame = CGRectMake(self.frame.size.width - KKCOLLAccessoryRightMargin - KKCOLLAccessoryWidth,
                                      (self.frame.size.height - KKCOLLAccessoryHeight) / 2.0,
                                      KKCOLLAccessoryWidth, KKCOLLAccessoryHeight);
    [self.contentView addSubview:_accessoryView];
    [self.contentView bringSubviewToFront:_accessoryView];
}


#pragma mark - background color image

- (void)setBackgroundViewImage:(UIImage *)backgroundViewImage
{
    _backgroundViewImage = backgroundViewImage;
    if (!_backgroundViewImage && !_backgroundViewColor) {
        [_kk_backgroundView removeFromSuperview];
        _kk_backgroundView = nil;
        self.backgroundView = nil;
        return;
    }
    if (!_kk_backgroundView) {
        self.backgroundView = self.kk_backgroundView;
    }
    self.kk_backgroundView.image = backgroundViewImage;
}

- (void)setSelectedBackgroundViewImage:(UIImage *)selectedBackgroundViewImage
{
    _selectedBackgroundViewImage = selectedBackgroundViewImage;
    if (!_selectedBackgroundViewImage && !_selectedBackgroundViewColor) {
        [_kk_selectedBackgroundView removeFromSuperview];
        _kk_selectedBackgroundView = nil;
        self.selectedBackgroundView = nil;
        return;
    }
    if (!_kk_selectedBackgroundView) {
        self.selectedBackgroundView = self.kk_selectedBackgroundView;
    }
    self.kk_selectedBackgroundView.image = selectedBackgroundViewImage;
}

- (void)setBackgroundViewColor:(UIColor *)backgroundViewColor
{
    _backgroundViewColor = backgroundViewColor;
    if (!_backgroundViewImage && !_backgroundViewColor) {
        [_kk_backgroundView removeFromSuperview];
        _kk_backgroundView = nil;
        self.backgroundView = nil;
        return;
    }
    if (!_kk_backgroundView) {
        self.backgroundView = self.kk_backgroundView;
    }
    self.kk_backgroundView.backgroundColor = backgroundViewColor;
}

- (void)setSelectedBackgroundViewColor:(UIColor *)selectedBackgroundViewColor
{
    _selectedBackgroundViewColor = selectedBackgroundViewColor;
    if (!_selectedBackgroundViewImage && !_selectedBackgroundViewColor) {
        [_kk_selectedBackgroundView removeFromSuperview];
        _kk_selectedBackgroundView = nil;
        self.selectedBackgroundView = nil;
        return;
    }
    if (!_kk_selectedBackgroundView) {
        self.selectedBackgroundView = self.kk_selectedBackgroundView;
    }
    self.kk_selectedBackgroundView.backgroundColor = selectedBackgroundViewColor;
}

- (void)setBackgroundViewColor:(UIColor *)backgroundViewColor contentMode:(UIViewContentMode)contentMode
{
    self.backgroundViewColor = backgroundViewColor;
    _kk_backgroundView.contentMode = contentMode;
}

- (void)setSelectedBackgroundViewImage:(UIImage *)selectedBackgroundViewImage contentMode:(UIViewContentMode)contentMode
{
    self.selectedBackgroundViewImage = selectedBackgroundViewImage;
    _kk_selectedBackgroundView.contentMode = contentMode;
}
- (UIImageView *)kk_backgroundView
{
    if (!_kk_backgroundView) {
        _kk_backgroundView = [[UIImageView alloc]init];
        _kk_backgroundView.contentMode = UIViewContentModeScaleAspectFill;
        _kk_backgroundView.layer.masksToBounds = YES;
    }
    return _kk_backgroundView;
}

- (UIImageView *)kk_selectedBackgroundView
{
    if (!_kk_selectedBackgroundView) {
        _kk_selectedBackgroundView = [[UIImageView alloc]init];
        _kk_selectedBackgroundView.contentMode = UIViewContentModeScaleAspectFill;
        _kk_selectedBackgroundView.layer.masksToBounds = YES;
    }
    return _kk_selectedBackgroundView;
}

#pragma mark - separator

- (void)setSeparatorInset:(UIEdgeInsets)separatorInset
{
    _separatorInset = separatorInset;
    self.separatorView.frame = CGRectMake(self.separatorInset.left,
                                      self.separatorInset.top,
                                      self.frame.size.width - self.separatorInset.left - self.separatorInset.right,
                                      self.frame.size.height - self.separatorInset.top - self.separatorInset.bottom);
}

- (void)setSeparatorColor:(UIColor *)separatorColor
{
    _separatorColor = separatorColor;
    self.separatorView.backgroundColor = _separatorColor;
}

- (void)setSeparatorStyle:(KKCollectionViewCellSeparatorStyle)separatorStyle
{
    _separatorStyle = separatorStyle;
    if (_separatorStyle == KKCollectionViewCellSeparatorStyleNone) {
        [_separatorView removeFromSuperview];
        _separatorView = nil;
    }else if(_separatorStyle == KKCollectionViewCellSeparatorStyleLine){
        [self addSubview:self.separatorView];
    }
}

- (UIView *)separatorView
{
    if (!_separatorView) {
        _separatorView = [[UIView alloc]init];
        _separatorView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _separatorView.frame = CGRectMake(self.separatorInset.left,
                                         self.separatorInset.top,
                                         self.frame.size.width - self.separatorInset.left - self.separatorInset.right,
                                         self.frame.size.height - self.separatorInset.top - self.separatorInset.bottom);
        _separatorView.backgroundColor = self.separatorColor;
    }
    return _separatorView;
}

@end


