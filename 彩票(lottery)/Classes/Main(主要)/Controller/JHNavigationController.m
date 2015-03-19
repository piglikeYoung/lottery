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
    // 1.设置导航条的主题
    // 如果要同时设置很多UINavigationBar的样式, 可以通过设置UINavigationBar的主题的方式来设置以便简化代码
    UINavigationBar *navBar = [UINavigationBar appearance];
    // 1.1设置所有导航条的背景图片
    // 判断当前运行的操作系统的版本
    if (iOS7) {
        [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    } else {
        [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar"] forBarMetrics:UIBarMetricsDefault];
    }
    
    // 设置导航条上返回按钮和图片(小齿轮)的颜色
    [navBar setTintColor:[UIColor whiteColor]];
    
    // 1.2设置所有导航条的标题颜色
    NSMutableDictionary *md = [NSMutableDictionary dictionary];
    md[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    md[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [navBar setTitleTextAttributes:md];
    
    // 1.3设置UIBarButtonItem的主题
    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
    
    if (!iOS7) {
        // 设置普通按钮的图片
        UIImage *norImage = [UIImage imageNamed:@"NavButton"];
        [barItem setBackgroundImage:norImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        UIImage *higImage = [UIImage imageNamed:@"NavButtonPressed"];
        [barItem setBackgroundImage:higImage forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        //  设置返回按钮的图片
        UIImage *norBackImage = [UIImage imageNamed:@"NavBackButton"];
        [barItem setBackButtonBackgroundImage:norBackImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        
        UIImage *higBackImage = [UIImage imageNamed:@"NavBackButtonPressed"];
        [barItem setBackButtonBackgroundImage:higBackImage forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    } else {
        // 是iOS7
        NSMutableDictionary *barMd = [NSMutableDictionary dictionary];
        barMd[NSFontAttributeName] = [UIFont systemFontOfSize:16];
        barMd[NSForegroundColorAttributeName] = [UIColor whiteColor];
        [barItem setTitleTextAttributes:barMd forState:UIControlStateNormal];
    }
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 拿到目标控制器（即将要入栈的控制器），设置它的自动隐藏TabBar
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:YES];
}

@end
