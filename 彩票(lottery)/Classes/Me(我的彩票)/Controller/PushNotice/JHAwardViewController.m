//
//  JHAwardViewController.m
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/20.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHAwardViewController.h"

@interface JHAwardViewController ()

@end

@implementation JHAwardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self add0SectionItems];
}

#pragma mark 添加第0组的模型数据
- (void)add0SectionItems
{
    // 1.1.推送和提醒
    JHSettingItem *item00 = [[JHSettingSwitchItem alloc]initWithIcon:nil title:@"双色球"];
    JHSettingItem *item01 = [[JHSettingSwitchItem alloc]initWithIcon:nil title:@"大乐透"];
    
    
    
    JHSettingGroup *group = [[JHSettingGroup alloc] init];
    group.headerTitle= @"发货就打开了手机付款链接的数量开发建设的路口见发牢骚的空间";
    group.items = @[item00, item01];
    [self.datas addObject:group];
}

@end
