//
//  MyAnnotation.m
//  地图
//
//  Created by mac on 15/10/8.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation
- (CLLocationCoordinate2D)coordinate;
{
    return _coordinate;
}
- (NSString *)title
{
    return _title;
}
- (NSString *)subtitle
{
    return _subTitle;
}
- (id)initWithCoordinate:(CLLocationCoordinate2D)tempCoordinate title:(NSString *)tempTitle subTitle:(NSString *)tempSubtitle

{
    self = [super init];
    if (self) {
        _coordinate = tempCoordinate;
        _title = tempTitle;
        _subTitle = tempSubtitle;
    }
    return self;
}

@end
