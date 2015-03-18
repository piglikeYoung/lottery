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
        
    // 2.删除系统自带的TabBar
    [self.tabBar removeFromSuperview];
}

#pragma mark - JHTabBarDelegate
-(void)tabBarDidSelectBtnFrom:(NSInteger)from to:(NSInteger)to
{
    // 切换子控制器
    self.selectedIndex = to;
}


@end
