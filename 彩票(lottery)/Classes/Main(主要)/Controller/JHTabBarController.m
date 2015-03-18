//
//  JHTabBarController.m
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/18.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHTabBarController.h"
#import "JHTabBar.h"
#import "JHTabBarButton.h"

@interface JHTabBarController ()<JHTabBarDelegate>

@end

@implementation JHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.创建自定义的TabBar
    JHTabBar *myTabBar = [[JHTabBar alloc] init];
    myTabBar.frame = self.tabBar.frame;
    myTabBar.delegate = self;
    
    [self.view addSubview:myTabBar];
    
    // 1.1根据系统子控制器的个数来创建自定义TabBar上按钮的个数
    for (int i = 0; i < self.viewControllers.count; i++) {
        // 通知自定义TabBar创建按钮
        NSString *norImageName = [NSString stringWithFormat:@"TabBar%d", i + 1];
        NSString *disableImageName = [NSString stringWithFormat:@"TabBar%dSel", i + 1];
        
        // 只要调用自定义TabBar的该方法就会创建一个按钮
        [myTabBar addTabBarButtonWithNormalImageName:norImageName andDisableImageName:disableImageName];
    }
    
        
    // 2.删除系统自带的TabBar
    [self.tabBar removeFromSuperview];
    
    // 3.设置导航条的主题
    // 如果要同时设置很多UINavigationBar的样式, 可以通过设置UINavigationBar的主题的方式来设置以便简化代码
    UINavigationBar *navBar = [UINavigationBar appearance];
    // 3.1设置所有导航条的背景图片
    // 判断当前运行的操作系统的版本
    if (iOS7) {
        [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    } else {
        [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar"] forBarMetrics:UIBarMetricsDefault];
    }
    
    // 3.2设置所有导航条的标题颜色
    NSMutableDictionary *md = [NSMutableDictionary dictionary];
    md[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    md[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [navBar setTitleTextAttributes:md];
}

#pragma mark - JHTabBarDelegate
-(void)tabBarDidSelectBtnFrom:(NSInteger)from to:(NSInteger)to
{
    // 切换子控制器
    self.selectedIndex = to;
}




@end
