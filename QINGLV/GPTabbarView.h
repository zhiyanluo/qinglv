//
//  GPTabbarView.h
//  09-自定义TabbarController
//
//  Created by vera on 15/8/19.
//  Copyright (c) 2015年 vera. All rights reserved.
//

#import <UIKit/UIKit.h>

//tabbar高度
#define kGPTabbarViewHeight 49

//点击tabbarButton的回调
typedef void(^TabbarViewDidSelectedIndexBlock)(NSInteger currentIndex);

@interface GPTabbarView : UIView

//设置tabbarItem
- (void)setTabbarItems:(NSArray *)items;

/**
 *  默认选中哪个
 *
 *  @param currentIndex 选中的下标
 */
- (void)setSelectedIndex:(NSInteger)currentIndex;

/**
 *  设置回调
 *
 *  @param block <#block description#>
 */
- (void)setTabbarViewDidSelectedIndexWithBlock:(TabbarViewDidSelectedIndexBlock)block;

@end
