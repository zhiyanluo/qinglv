//
//  SlideView.m
//  爱卡汽车
//
//  Created by 罗志炎 on 15/10/13.
//  Copyright (c) 2015年 罗志炎. All rights reserved.
//

#import "SlideView.h"

@interface SlideView ()

@end

@implementation SlideView
#pragma mark - 懒加载
-(UIScrollView *)s
{
    if (!_s) {
        _s = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 300, 44)];
        _s.showsHorizontalScrollIndicator = NO;
    }
    return _s;
}
-(UIView *)v
{
    if (!_v) {
        _v = [[UIView alloc]initWithFrame:CGRectMake(0, 37, 75, 2)];
        _v.backgroundColor = [UIColor colorWithRed:135/255.0 green:206/255.0 blue:235/255.0 alpha:1];
    }
    return _v;
    
}
#pragma mark - settter方法
-(void)setItems:(NSMutableArray *)items
{
    _items = items;
    for (UIView  *v  in self.s.subviews) {
        [v removeFromSuperview];
    }
    self.s.contentSize = CGSizeMake(self.items.count * 75, 44) ;
    [self addView];
    
}
/**
 * 加载视图
 */
-(void)addView
{
    
    
    [self addSubview:self.s];
    for (int i = 0; i<self.items.count; i++) {
        UIButton * b = [[UIButton alloc]init];
        b.frame = CGRectMake(i * 75, 5, 75, 30);
        [b setTitle:self.items[i] forState:UIControlStateNormal];
        [b setTitleColor:[UIColor colorWithRed:135/255.0 green:206/255.0 blue:235/255.0 alpha:1] forState:UIControlStateNormal];
        b.tag = 10 + i;
        [b addTarget:self action:@selector(selectors:) forControlEvents:UIControlEventTouchUpInside];
        [_s addSubview:b];

    }
    [_s addSubview:self.v];
}
/**
 *  开始默认顶部的view
 *
 *  @param btn <#btn description#>
 */
-(void)selectors:(UIButton *)btn
{
    

 if (self.items.count>4) {
        self.s.contentOffset = CGPointMake(75 * (btn.tag - 11)-30, 0);
    }
    CGRect frame = self.v.frame;
    frame.origin.x =75 * (btn.tag - 10);
    self.v.frame = frame;
    
  // NSLog(@"%@ %ld ",[btn currentTitle],(long)btn.tag);
   [[NSNotificationCenter defaultCenter] postNotificationName:@"ChangeCtrNotificationName" object:btn];

}

@end
