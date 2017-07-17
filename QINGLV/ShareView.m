//
//  ShareView.m
//  爱卡汽车
//
//  Created by 罗志炎 on 15/10/15.
//  Copyright (c) 2015年 罗志炎. All rights reserved.
//

#import "ShareView.h"
#import "UIView+Toast.h"
@implementation ShareView

#pragma mark - 回调方法
-(void)setXinglangShareBlock:(void (^)())xinglangShareBlock
{
    _xinglangShareBlock = xinglangShareBlock;
}
-(void)setTitleSizeBlock:(void (^)())titleSizeBlock
{
    _titleSizeBlock = titleSizeBlock;
}
-(void)setTitleSuperSizeBlock:(void (^)())titleSuperSizeBlock
{
    _titleSuperSizeBlock = titleSuperSizeBlock;
}
-(void)setTitleBigSizeBlock:(void (^)())titleBigSizeBlock
{
    _titleBigSizeBlock = titleBigSizeBlock;
}
/**
 *  分享到新浪
 *
 *  @param sender <#sender description#>
 */
- (IBAction)xinlang:(UIButton *)sender
{
    if (self.xinglangShareBlock) {
        self.xinglangShareBlock();
    }
}
/**
 *  设置字体大小
 *
 *  @param sender <#sender description#>
 */
- (IBAction)titleSize:(UISegmentedControl *)sender {
   
    switch ([sender selectedSegmentIndex]) {
        case 0:
        {
            if (self.titleSizeBlock) {
                self.titleSizeBlock();
            }        }
            break;
        case 1:
        {
            if (self.titleBigSizeBlock) {
                self.titleBigSizeBlock();
            }
        }
            break;
        case 2:
        {
            if (self.titleSuperSizeBlock) {
                self.titleSuperSizeBlock();
            }
        }
            break;
        default:
            break;
    }}


/**
 *  copy
 *
 *  @param sender <#sender description#>
 */
- (IBAction)copyurl:(UIButton *)sender {
}
/**
 *  刷新
 *
 *  @param sender <#sender description#>
 */
- (IBAction)refresh:(UIButton *)sender {
    [self.superview makeToast:@"亲,已经是最新了哦!" duration:1.5 position:[NSValue valueWithCGPoint:super.center]];
}
/**
 *  取消
 *
 *  @param sender <#sender description#>
 */
- (IBAction)cancel:(UIButton *)sender {
    self.hidden = YES;
}
@end
