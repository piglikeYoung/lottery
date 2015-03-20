//
//  JHPushNoticeController.m
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/20.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHPushNoticeController.h"
#import "JHAwardViewController.h"
#import "JHAwardAnimationViewController.h"
#import "JHScoreTimeViewController.h"
#import "NJTestViewController.h"

@interface JHPushNoticeController ()

@end

@implementation JHPushNoticeController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self add0SectionItems];
}

#pragma mark 添加第0组的模型数据
- (void)add0SectionItems
{
    // 1.1.推送和提醒
    JHSettingArrowItem *item00 = [[JHSettingArrowItem alloc]initWithIcon:nil title:@"开奖号码推送" destClass:[JHAwardViewController class]];
    JHSettingArrowItem *item01 = [[JHSettingArrowItem alloc]initWithIcon:nil title:@"中奖动画" destClass:[JHAwardAnimationViewController class]];
    JHSettingArrowItem *item02 = [[JHSettingArrowItem alloc]initWithIcon:nil title:@"比分直播" destClass:[JHScoreTimeViewController class]];
    JHSettingArrowItem *item03 = [[JHSettingArrowItem alloc]initWithIcon:nil title:@"购彩定时提醒" destClass:[NJTestViewController class]];
    
    JHSettingGroup *group = [[JHSettingGroup alloc] init];
    group.items = @[item00, item01, item02, item03];
    [self.datas addObject:group];
}


@end
