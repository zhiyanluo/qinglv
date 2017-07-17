//
//  SlideView.h
//  爱卡汽车
//
//  Created by 罗志炎 on 15/10/13.
//  Copyright (c) 2015年 罗志炎. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlideView : UIView
/**
 *  上面按钮的个数
 */
@property(nonatomic,strong)NSMutableArray * items;
/**
 *  上面的view
 */
@property(nonatomic,strong)UIView * v;
/**
 *  上部可滑动的view
 */
@property(nonatomic,strong)UIScrollView * s;
@end
