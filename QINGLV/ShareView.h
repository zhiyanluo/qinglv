//
//  ShareView.h
//  爱卡汽车
//
//  Created by 罗志炎 on 15/10/15.
//  Copyright (c) 2015年 罗志炎. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareView : UIView
//新浪微博回调
@property(nonatomic,copy)void(^xinglangShareBlock)();
@property(nonatomic,copy)void(^titleSizeBlock)();
//字体大小回调
@property(nonatomic,copy)void(^titleBigSizeBlock)();
@property(nonatomic,copy)void(^titleSuperSizeBlock)();
- (IBAction)xinlang:(UIButton *)sender;
- (IBAction)titleSize:(UISegmentedControl *)sender;
//复制
- (IBAction)copyurl:(UIButton *)sender;
//刷新
- (IBAction)refresh:(UIButton *)sender;
//取消
- (IBAction)cancel:(UIButton *)sender;

@end
