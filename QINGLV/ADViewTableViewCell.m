//
//  ADViewTableViewCell.m
//  YILV
//
//  Created by 罗志炎 on 15/10/24.
//  Copyright (c) 2015年 罗志炎. All rights reserved.
//

#import "ADViewTableViewCell.h"


#import "AFNetworking.h"
//#import "ADModel.h"
//#import "MeADModel.h"
//#import "UIImageView+WebCache.h"
#define kFORUMADSURL @"http://a.xcar.com.cn/interface/6.0/getNewsList.php?limit=10&offset=0&type=1&ver=6.0.3"
#define kTWOVIEWURL @"http://mi.xcar.com.cn/interface/xcarapp/getSelectedPostList.php?limit=20&offset=0&ver=6.0.3"

@interface ADViewTableViewCell ()<UIScrollViewDelegate>

//广告栏
@property(nonatomic,weak)UIScrollView * scroll;
//定时器
@property(nonatomic,strong)NSTimer * timer;
//页码
@property(nonatomic,weak)UIPageControl * pageControl;
//上面广告栏数据
@property(nonatomic,strong)NSMutableArray * data;
//下面cell数据
@property(nonatomic,strong)NSMutableArray * data1;
@end

@implementation ADViewTableViewCell
#pragma mark - 懒加载

-(NSMutableArray *)data
{
    if (!_data) {
        _data = [NSMutableArray array];
    }
    return _data;
}
-(NSMutableArray *)data1
{
    if (!_data1) {
        _data1 = [NSMutableArray array];
    }
    return _data1;
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self show];
    }
   
    return self;
}
-(void)show
{
    
     UIScrollView * scroll = [[UIScrollView alloc]initWithFrame:self.contentView.bounds];
    [self.contentView addSubview:scroll];
    self.scroll = scroll;
    
    //         ADModel * model1 = nil;
    //         MeADModel * model2 = nil;
    for (int i = 0; i<5; i++) {
        
        UIImageView * image = [[UIImageView alloc]initWithFrame:CGRectMake(i*375, 0, 375, 200)];
        image.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i+1] ];
        [_scroll addSubview:image];
        
    }
    
    _scroll.contentSize = CGSizeMake(375*5, 100);
    
    _scroll.pagingEnabled = YES;
    _scroll.delegate = self;
    
    
    UIPageControl * pageControl = [[UIPageControl  alloc] init];
    [self.contentView addSubview:pageControl];
    self.pageControl = pageControl;
    
    
    pageControl.currentPageIndicatorTintColor = [UIColor yellowColor];
    pageControl.pageIndicatorTintColor = [UIColor greenColor];
    _scroll.contentSize = CGSizeMake(5 * 375,0);
    
    
    self.pageControl.numberOfPages = 5;
    
    self.pageControl.center = CGPointMake(self.frame.size.width-60, self.frame.size.height - 10);
    
    
    [self startTimer];
    
}
//请求数据
- (void)startRequestDataFromNetWork:(NSString *)strUrl
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:strUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         //
         //         if ([self.number isEqualToString:@"0"]) {
         //              NSDictionary *json = responseObject[@"focusList"];
         //             for (NSDictionary * dict in json[@"focusImgs"]) {
         //
         //                 ADModel * model = [ADModel ADModelWithDict:dict];
         //                 [self.data addObject:model];
         //             }
         //         }
         //         if ([self.number isEqualToString:@"1"]) {
         //              NSDictionary *json = responseObject[@"focusPost"];
         //             for (NSDictionary * dict in json)
         //             {
         //
         //                 MeADModel * model = [MeADModel MeADModelWithDict:dict];
         //                 [self.data1 addObject:model];
         //             }
         //         }
         
         
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         //提示
         
         NSLog(@"---- error: %@",error);
         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请求数据失败" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
         [alert show];
     }];
}

//定时器
- (void)startTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(autoScroll) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)autoScroll
{
    
    int totalCount = 5;
    

    int page = self.pageControl.currentPage >= totalCount - 1 ? 0 : self.pageControl.currentPage + 1;
    
    
    CGFloat offSetX = page  * self.scroll.frame.size.width;
    
    self.scroll.contentOffset = CGPointMake(offSetX, 0);
}


#pragma mark - scrollview代理方法

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint contentOffSet = scrollView.contentOffset;
    
    int page = (contentOffSet.x + scrollView.frame.size.width * 0.5) / scrollView.frame.size.width;
    
    self.pageControl.currentPage = page;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //干掉timer
    [self.timer invalidate];
    self.timer = nil;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}

@end
