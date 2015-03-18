//
//  JHTabBar.m
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/18.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHTabBar.h"
#import "JHTabBarButton.h"

@interface JHTabBar()

// 定义变量记录当前选中的按钮
@property (weak , nonatomic) UIButton *selectBtn;

@end

@implementation JHTabBar

- (void)addTabBarButtonWithNormalImageName:(NSString *)norName andDisableImageName:(NSString *)disName
{
    // 3.1创建按钮
    JHTabBarButton *btn = [[JHTabBarButton alloc] init];
    
    // 3.2设置按钮上显示的图片
    // 3.2.1设置默认状态图片
    [btn setBackgroundImage:[UIImage imageNamed:norName] forState:UIControlStateNormal];
    
    // 3.2.2设置不可用状态图片
    [btn setBackgroundImage:[UIImage imageNamed:disName] forState:UIControlStateDisabled];
    
    // 3.4添加按钮到自定义TabBar
    [self addSubview:btn];
    
    // 3.5监听按钮点击事件
    [btn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchDown];
    
    // 3.6设置默认选中按钮
    if (1 == self.subviews.count) {
        [self btnOnClick:btn];
    }
    
    // 3.7设置按钮高亮状态不调整图片
    btn.adjustsImageWhenHighlighted = NO;

}



-(void)layoutSubviews
{
    [super layoutSubviews];
    
    for (int i = 0; i<self.subviews.count; i++) {
        UIButton *btn = self.subviews[i];
        
        // 3.3设置frame
        CGFloat btnY = 0;
        CGFloat btnW = self.frame.size.width / self.subviews.count;
        CGFloat btnH = self.frame.size.height;
        CGFloat btnX = i * btnW;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        // 3.8设置按钮的Tag作为将来切换子控制器的索引
        btn.tag = i;
    }
}

- (void)btnOnClick:(UIButton *)btn
{
    // 3.切换子控制器
    // 通知TabBarController切换控制器
    if ([self.delegate respondsToSelector:@selector(tabBarDidSelectBtnFrom:to:)]) {
        [self.delegate tabBarDidSelectBtnFrom:self.selectBtn.tag to:btn.tag];
    }
    
    // 0.取消上次选中的按钮
    self.selectBtn.enabled = YES;
    
    // 1.设置当前被点击按钮为选中状态
    btn.enabled = NO;
    
    // 2.记录当前选中的按钮
    self.selectBtn = btn;
}



@end
