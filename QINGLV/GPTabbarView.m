//
//  GPTabbarView.m
//  09-自定义TabbarController
//
//  Created by vera on 15/8/19.
//  Copyright (c) 2015年 vera. All rights reserved.
//

#import "GPTabbarView.h"
#import "GPTabbarButton.h"

@interface GPTabbarView ()
{
    //保存所有item对象
    NSArray *_items;
    
    TabbarViewDidSelectedIndexBlock _block;
}

@end

@implementation GPTabbarView

#pragma setter方法
- (void)setTabbarItems:(NSArray *)items
{
    if (items.count == 0)
    {
        return;
    }
    
    _items = items;
    
    //按钮宽度
    CGFloat buttonWidth = self.frame.size.width / items.count;
    
    //创建GPTabbarButton对象
    for (int i = 0; i < items.count; i++)
    {
        GPTabbarButton *button = [[GPTabbarButton alloc] initWithFrame:CGRectMake(buttonWidth * i, 0, buttonWidth, kGPTabbarViewHeight)];
        //设置图片，文字，选中的图片，徽标
        button.tabbarItem = items[i];
        //设置tag
        button.tag = i + 1;
        //添加事件
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        //第一个默认选中
        if (i == 0)
        {
            button.selected = YES;
        }
    }
}

/**
 *  设置回调
 *
 *  @param block <#block description#>
 */
- (void)setTabbarViewDidSelectedIndexWithBlock:(TabbarViewDidSelectedIndexBlock)block
{
    _block = block;
}

#pragma mark - tabbarButton点击事件处理
- (void)buttonClick:(GPTabbarButton *)clickButton
{
    //1.先把所有的按钮改为未选中状态
    for (int i = 0; i < _items.count; i++)
    {
        GPTabbarButton *unSelectedButton = (GPTabbarButton *)[self viewWithTag:i+1];
        unSelectedButton.selected = NO;
    }
    
    //2.再把当前点击的按钮改为选中状态
    clickButton.selected = YES;
    
    //3.回调
    if (_block)
    {
        _block(clickButton.tag - 1);
    }
}

/**
 *  默认选中哪个
 *
 *  @param currentIndex 选中的下标
 */
- (void)setSelectedIndex:(NSInteger)currentIndex
{
    for (int i = 0; i < _items.count; i++)
    {
        GPTabbarButton *button = (GPTabbarButton *)[self viewWithTag:i+1];
        
        //选中
        if (i == currentIndex)
        {
            button.selected = YES;
        }
        else
        {
            button.selected = NO;
        }
        
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
