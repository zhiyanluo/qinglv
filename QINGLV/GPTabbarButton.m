//
//  GPTabbarButton.m
//  09-自定义TabbarController
//
//  Created by vera on 15/8/19.
//  Copyright (c) 2015年 vera. All rights reserved.
//

#import "GPTabbarButton.h"
#import "NSString+Addition.h"

//图片距离上部的距离
#define kImageViewYOffset 5
//图片视图高度
#define kImageViewHeight 25

//徽标圆角半径
#define kBadgeLabelCornerRadius 10

//徽标label的高度
#define kBadgeLabelHeight 20

//徽标的字体大小
#define kBadgeLabelFont 13

//徽标最大宽度
#define kBadgeLabelMaxWidth 80

//徽标距离按钮右边的距离
static int xLeftOffset = kImageViewYOffset;

@interface GPTabbarButton ()

/**
 *  图片
 */
@property (nonatomic, weak) UIImageView *imageView;

/**
 *  文字
 */
@property (nonatomic, weak) UILabel *titleLabel;

/**
 *  徽标
 */
@property (nonatomic, weak) UILabel *badgeLabel;

@end

@implementation GPTabbarButton

#pragma mark - 懒加载创建控件
- (UIImageView *)imageView
{
    if (!_imageView)
    {
        UIImageView *imageView = [[UIImageView alloc] init];
        //最佳比例显示，保证图片不拉伸
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:imageView];
        
        _imageView = imageView;
    }
    
    return _imageView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        UILabel *l = [self createLabelWithTextColor:[UIColor lightGrayColor] font:[UIFont systemFontOfSize:13] textAlignment:NSTextAlignmentCenter];
        [self addSubview:l];
        
        _titleLabel = l;
    }
    
    return _titleLabel;
}

- (UILabel *)badgeLabel
{
    if (!_badgeLabel)
    {
        UILabel *l = [self createLabelWithTextColor:[UIColor whiteColor] font:[UIFont boldSystemFontOfSize:kBadgeLabelFont] textAlignment:NSTextAlignmentCenter];
        l.frame = CGRectMake(self.frame.size.width - kBadgeLabelHeight, kImageViewYOffset, kBadgeLabelHeight, kBadgeLabelHeight);
        l.backgroundColor = [UIColor redColor];
        //设置圆角半径
        l.layer.cornerRadius = kBadgeLabelCornerRadius;
        //剪切超过父图层的范围
        l.layer.masksToBounds = YES;
        [self addSubview:l];
        
        _badgeLabel = l;
    }
    
    return _badgeLabel;
}

/**
 *  创建一个label
 *
 *  @param textColor     文字颜色
 *  @param font          字体大小（传nil表示17号字体）
 *  @param textAlignment 对齐方式
 *
 *  @return <#return value description#>
 */
- (UILabel *)createLabelWithTextColor:(UIColor *)textColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *l = [[UILabel alloc] init];
    l.textAlignment = textAlignment;
    l.textColor = textColor;
    
    if (!font)
    {
        l.font = [UIFont systemFontOfSize:17];
    }
    else
    {
        l.font = font;
    }
    
    return l;
}

#pragma mark - Setter方法
- (void)setTabbarItem:(UITabBarItem *)tabbarItem
{
    _tabbarItem = tabbarItem;
    
    //赋值
    self.imageView.image = tabbarItem.image;
    self.titleLabel.text = tabbarItem.title;
    
    if (tabbarItem.badgeValue)
    {
        //1.显示
        self.badgeLabel.hidden = NO;
        
        //2.赋值
        self.badgeLabel.text = tabbarItem.badgeValue;
        
        //3/重新设置徽标的label的坐标大小
        [self resetBadgeLabelFrame];

    }
    else
    {
        //隐藏
        self.badgeLabel.hidden = YES;
    }
    
}

#pragma mark - 重写父类setSelected:方法
- (void)setSelected:(BOOL)selected
{
    
    UIImage *image = nil;
    UIColor *textColor = nil;
    
    //选中
    if (selected)
    {
        image = _tabbarItem.selectedImage;
        textColor = [UIColor whiteColor];
    }
    else
    {
        image = _tabbarItem.image;
        textColor = [UIColor lightGrayColor];
    }
    
    //赋值
    self.imageView.image = image;
    self.titleLabel.textColor = textColor;
}

#pragma mark - layoutSubviews
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    //设置frame
    self.imageView.frame = CGRectMake(0, kImageViewYOffset, self.frame.size.width, kImageViewHeight);
    self.titleLabel.frame = CGRectMake(0, kImageViewYOffset + kImageViewHeight, self.frame.size.width, self.frame.size.height - kImageViewHeight - kImageViewYOffset);
    /**
     *  重新设置徽标的label的坐标大小
     */
    [self resetBadgeLabelFrame];
    
    //self.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
    

}

/**
 *  重新设置徽标的label的坐标大小
 */
- (void)resetBadgeLabelFrame
{
    //计算文字宽度
    CGFloat width = [self.tabbarItem.badgeValue sizeWithFont:[UIFont systemFontOfSize:kBadgeLabelFont] maxSize:CGSizeMake(kBadgeLabelMaxWidth, MAXFLOAT)].width;
    
    //调整徽标的宽度
    CGRect frame = self.badgeLabel.frame;
    frame.size.width = MAX(20, width) + 5;
    frame.origin.x = self.frame.size.width - frame.size.width - xLeftOffset;
    self.badgeLabel.frame = frame;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
