//
//  CenterTableViewCell.m
//  YILV
//
//  Created by 罗志炎 on 15/10/24.
//  Copyright (c) 2015年 罗志炎. All rights reserved.
//

#import "CenterTableViewCell.h"

@implementation CenterTableViewCell

- (void)awakeFromNib {
    for (int  i = 0; i<6; i++) {
        
        UIButton * b = [[UIButton alloc]init];
        if (i%2 == 1) {
            b.frame = CGRectMake(6+i*61, 35, 55, 55);
            
        }
        if (i%2 == 0) {
            b.frame = CGRectMake(6+i*61, 55, 55, 55);
        }
        
        b.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
        b.layer.masksToBounds = YES;
        b.layer.cornerRadius = 55/2;
        b.tag = 10+i;
        [b addTarget:self action:@selector(show:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:b];
    }
    // Initialization code
}
-(void)show:(UIButton *)btn

{
    NSLog(@"%ld",(long)btn.tag);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
