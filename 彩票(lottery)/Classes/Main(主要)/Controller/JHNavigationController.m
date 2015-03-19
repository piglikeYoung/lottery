//
//  JHNavigationController.m
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/19.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHNavigationController.h"

@interface JHNavigationController ()

@end

@implementation JHNavigationController

// 当该类第一次用到的时候就调用
+ (void)initialize
{
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

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 拿到目标控制器（即将要入栈的控制器），设置它的自动隐藏TabBar
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:YES];
}

@end
