//
//  KKTextCell.m
//  KKCell
//
//  Created by KING_KE on 2016/11/8.
//  Copyright © 2016年 com.KK. All rights reserved.
//

#import "KKTextCell.h"

NSString * const KKTextCellReuseID = @"KKTextCellReuseID";

@interface KKTextCell ()
{
    UILabel * _textLabel;
}
@property(nonatomic, weak)id <KKTextCellDataProtocol> data;
@end

@implementation KKTextCell

- (void)commitInit
{
    [super commitInit];
    [self.contentView addSubview:self.textLabel];
    [self layoutTextLabel];
}

- (void)layoutTextLabel
{
    self.textLabel.frame = self.contentView.bounds;
    self.textLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

- (void)showData:(id<KKTextCellDataProtocol>)data
{
    [super showData:data];
    self.data = data;
    if ([data respondsToSelector:@selector(numberOfLines)]) {
        self.textLabel.numberOfLines = [data numberOfLines];
    }
    id text = [[self class] getShowText:data selected:self.isSelected];
    if ([text isKindOfClass:[NSString class]]) {
        self.textLabel.text = text;
    }else{
        self.textLabel.attributedText = text;
    }
}

- (void)setSelected:(BOOL)selected
{
    if (self.selected == selected) {
        return;
    }
    [super setSelected:selected];
    id text = [[self class] getShowText:self.data selected:selected];
    if ([text isKindOfClass:[NSString class]]) {
        self.textLabel.text = text;
    }else{
        self.textLabel.attributedText = text;
    }
}

+(CGFloat)calculHeightByData:(id<KKTextCellDataProtocol>)data andWidth:(CGFloat)width{
    return [self calculText:data width:width];
}

+ (CGFloat)calculWidthByData:(id<KKTextCellDataProtocol>)data andHeight:(CGFloat)height{
    return [self calculWidthWithText:data height:height];
}

+(CGFloat)calculWidthWithText:(id<KKTextCellDataProtocol>)data height:(CGFloat)height{
    static UILabel * label;
    if (!label) {
        label = [[UILabel alloc]init];
    }
    if ([data respondsToSelector:@selector(numberOfLines)]) {
        label.numberOfLines = [data numberOfLines];
    }
    id text = [[self class] getShowText:data selected:NO];
    if ([text isKindOfClass:[NSString class]]) {
        label.text = text;
    }else{
        label.attributedText = text;
    }
    CGRect rect ;
    rect.size = CGSizeMake(10, height);
    label.frame = rect;
    [label sizeToFit];
    return label.frame.size.width;
}


+(CGFloat)calculText:(id<KKTextCellDataProtocol>)data width:(CGFloat)width{
    static UILabel * label;
    if (!label) {
        label = [[UILabel alloc]init];
        label.numberOfLines = 0;
    }
    if ([data respondsToSelector:@selector(numberOfLines)]) {
        label.numberOfLines = [data numberOfLines];
    }
    id text = [[self class] getShowText:data selected:NO];
    if ([text isKindOfClass:[NSString class]]) {
        label.text = text;
    }else{
        label.attributedText = text;
    }
    CGRect rect ;
    rect.size = CGSizeMake(width, 10);
    label.frame = rect;
    [label sizeToFit];
    return label.frame.size.height;
}

+(NSAttributedString *)getShowText:(id<KKTextCellDataProtocol>)data selected:(BOOL)selected{
    if (!data) {
        return nil;
    }
    if ([data isKindOfClass:[NSString class]]) {
        return (id)data;
    }
    
    NSString * text = [data text] ? : ([data placeHolder] ? : nil);
    
    if (!text) {
        return nil;
    }
    
    NSMutableDictionary * dic = [[NSMutableDictionary alloc]init];
    
    NSMutableParagraphStyle * style = [[NSMutableParagraphStyle alloc]init];
    if ([data respondsToSelector:@selector(lineSpace)]) {
        style.lineSpacing = [data lineSpace];
    }
    
    if ([data respondsToSelector:@selector(alignment)]) {
        style.alignment = [data alignment];
    }else{
        style.alignment = NSTextAlignmentCenter;
    }
    
    if (!selected && [data respondsToSelector:@selector(textColor)] && [data textColor]) {
        [dic setObject:[data textColor] forKey:NSForegroundColorAttributeName];
    }else if (selected && [data respondsToSelector:@selector(selectedColor)] && [data selectedColor]){
        [dic setObject:[data selectedColor] forKey:NSForegroundColorAttributeName];
    }else{
        [dic setObject:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
    }
    
    CGFloat fontSize = 15;
    UIFont * font;
    
    if ([data respondsToSelector:@selector(fontSize)] && !selected) {
        fontSize = [data fontSize];
    }else if ([data respondsToSelector:@selector(selectedFontSize)] && selected){
        fontSize = [data selectedFontSize];
    }
    
    if ([data respondsToSelector:@selector(fontName)] && [data fontName]) {
        font = [UIFont fontWithName:[data fontName] size:fontSize];
    }
    
    if (!font) {
        font = [UIFont systemFontOfSize:fontSize];
    }
    
    [dic setObject:font forKey:NSFontAttributeName];
    
    [dic setObject:style forKey:NSParagraphStyleAttributeName];
    
    return [[NSAttributedString alloc]initWithString:text attributes:dic];
}

- (UILabel *)textLabel
{
    if (!_textLabel) {
        _textLabel = [[UILabel alloc]init];
    }
    return _textLabel;
}

@end
