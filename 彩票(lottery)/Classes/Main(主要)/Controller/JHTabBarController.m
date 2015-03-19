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
//    myTabBar.frame = self.tabBar.frame;
    // 特别注意:此处frame的Y值有问题，系统的TabBar在底部，Y值是400多，自定义TabBar放入父类的Y值应该是0，所以用bounds
    myTabBar.frame = self.tabBar.bounds;
    myTabBar.delegate = self;
    
//    [self.view addSubview:myTabBar];
    // 将自定义TabBar当作子类传入系统的TabBar，跳转的时候隐藏父类，子类也会跟着隐藏
    [self.tabBar addSubview:myTabBar];
    
    // 1.1根据系统子控制器的个数来创建自定义TabBar上按钮的个数
    for (int i = 0; i < self.viewControllers.count; i++) {
        // 通知自定义TabBar创建按钮
        NSString *norImageName = [NSString stringWithFormat:@"TabBar%d", i + 1];
        NSString *disableImageName = [NSString stringWithFormat:@"TabBar%dSel", i + 1];
        
        // 只要调用自定义TabBar的该方法就会创建一个按钮
        [myTabBar addTabBarButtonWithNormalImageName:norImageName andDisableImageName:disableImageName];
    }
    
        
    // 2.删除系统自带的TabBar
//    [self.tabBar removeFromSuperview];
    
}

#pragma mark - JHTabBarDelegate
-(void)tabBarDidSelectBtnFrom:(NSInteger)from to:(NSInteger)to
{
    // 切换子控制器
    self.selectedIndex = to;
}




@end
