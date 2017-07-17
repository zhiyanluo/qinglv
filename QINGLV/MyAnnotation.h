//
//  MyAnnotation.h
//  地图
//
//  Created by mac on 15/10/8.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface MyAnnotation : NSObject<MKAnnotation>
{
    CLLocationCoordinate2D _coordinate;
    NSString * _title;
    NSString * _subTitle;
}
//协议中三个属性的getter方法
- (CLLocationCoordinate2D)coordinate;
- (NSString *)title;
- (NSString *)subtitle;
- (id)initWithCoordinate:(CLLocationCoordinate2D)tempCoordinate title:(NSString *)tempTitle subTitle:(NSString *)tempSubtitle;

@end
