//
//  GPTabbarController.m
//  09-自定义TabbarController
//
//  Created by vera on 15/8/19.
//  Copyright (c) 2015年 vera. All rights reserved.
//

#import "GPTabbarController.h"

@interface GPTabbarController ()


//保存每个控制器的UITabbarItem对象
@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation GPTabbarController

- (NSMutableArray *)items
{
    if (!_items)
    {
        _items = [NSMutableArray array];
    }
    
    return _items;
}

/**
 *  创建tabbarView对象
 *
 *  @return <#return value description#>
 */
- (GPTabbarView *)tabbarView
{
    if (!_tabbarView)
    {
        GPTabbarView *tabbarView = [[GPTabbarView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - kGPTabbarViewHeight, self.view.frame.size.width, kGPTabbarViewHeight)];
        //设置层的内容
        tabbarView.layer.contents = (id)[UIImage imageNamed:@"tabbg"].CGImage;
        [self.view addSubview:tabbarView];
        
        _tabbarView = tabbarView;
    }
    
    return _tabbarView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    /*
     系统tabbar高度是49
     
     自定义tabbarController的原理：
     1.隐藏系统tabbar
     2.创建一个UIView，在view布局，然后添加到self.view
     */
    
    //1.隐藏系统tabbar
    self.tabBar.hidden = YES;
    
    self.tabbarView.backgroundColor = [UIColor clearColor];
    
    

}

/**
 *  重写父类方法
 *
 *  @param viewControllers <#viewControllers description#>
 */
- (void)setViewControllers:(NSArray *)viewControllers
{
    //1.调用父类的setter方法
    [super setViewControllers:viewControllers];
    
    //2.遍历获取UITabbarItem
    for (int i = 0; i < viewControllers.count; i++)
    {
        UIViewController *vc = viewControllers[i];
        
        [self.items addObject:vc.tabBarItem];
    
    }

    
    //2.创建tabbarView,并且添加tabbarButton
    [self.tabbarView setTabbarItems:self.items];
    
    //3.设置回调
    [self.tabbarView setTabbarViewDidSelectedIndexWithBlock:^(NSInteger currentIndex)
    {
        //切换控制器
        self.selectedIndex = currentIndex;
    }];
    
}

/**
 *  重写父类setSelectedIndex:方法
 */
- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [super setSelectedIndex:selectedIndex];
    
    //选中下标为selectedIndex的tabbarButton
    [self.tabbarView setSelectedIndex:selectedIndex];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
