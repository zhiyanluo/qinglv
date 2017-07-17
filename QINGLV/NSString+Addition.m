//
//  NSString+Addition.m
//  03-QQ聊天界面
//
//  Created by vera on 15/8/15.
//  Copyright (c) 2015年 vera. All rights reserved.
//

#import "NSString+Addition.h"

@implementation NSString (Addition)

/**
 *  根据文字计算size
 *
 *  @param font    <#font description#>
 *  @param maxSize <#maxSize description#>
 *
 *  @return <#return value description#>
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
}

@end
