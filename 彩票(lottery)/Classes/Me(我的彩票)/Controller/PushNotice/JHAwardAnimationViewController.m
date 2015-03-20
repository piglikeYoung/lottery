//
//  JHAwardAnimationViewController.m
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/20.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHAwardAnimationViewController.h"

@interface JHAwardAnimationViewController ()

@end

@implementation JHAwardAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self add0SectionItems];
}

#pragma mark 添加第0组的模型数据
- (void)add0SectionItems
{
    // 1.1.推送和提醒
    JHSettingItem *item00 = [[JHSettingSwitchItem alloc]initWithIcon:nil title:@"中奖动画"];
    
    JHSettingGroup *group = [[JHSettingGroup alloc] init];
    group.headerTitle= @"415645616515646546545645654";
    group.items = @[item00];
    [self.datas addObject:group];
}

@end
