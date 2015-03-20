//
//  JHScoreTimeViewController.m
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/20.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHScoreTimeViewController.h"

@interface JHScoreTimeViewController ()

@end

@implementation JHScoreTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self add0SectionItems];
}

#pragma mark 添加第0组的模型数据
- (void)add0SectionItems
{
    // 1.1.推送和提醒
    JHSettingItem *item00 = [[JHSettingSwitchItem alloc]initWithIcon:nil title:@"提醒我关注的比赛"];
    
    JHSettingGroup *group = [[JHSettingGroup alloc] init];
    group.footerTitle= @"415645616515646546545645654";
    group.items = @[item00];
    
    JHSettingItem *item10 = [[JHSettingLabelItem alloc]initWithIcon:nil title:@"起开时间"];
    JHSettingGroup *group1 = [[JHSettingGroup alloc] init];
    group1.items = @[item10];
    
    JHSettingItem *item20 = [[JHSettingLabelItem alloc]initWithIcon:nil title:@"结束时间"];
    JHSettingGroup *group2 = [[JHSettingGroup alloc] init];
    group2.items = @[item20];
    
    [self.datas addObject:group];
    [self.datas addObject:group1];
    [self.datas addObject:group2];
    
    
}


@end
