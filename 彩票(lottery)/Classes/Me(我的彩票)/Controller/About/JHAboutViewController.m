//
//  JHAboutViewController.m
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/20.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHAboutViewController.h"
#import "JHAboutHeaderView.h"

@interface JHAboutViewController ()

@end

@implementation JHAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JHSettingItem *item00 = [[JHSettingArrowItem alloc] initWithIcon:nil title:@"评分支持"];
    
    JHSettingItem *item01 = [[JHSettingArrowItem alloc] initWithIcon:nil title:@"客服电话"];
    
    item01.subTitle = @"123456789";
    
    JHSettingGroup *group = [[JHSettingGroup alloc] init];
    group.items = @[item00,item01];
    [self.datas addObject:group];
    
    self.tableView.tableHeaderView = [JHAboutHeaderView headerView];
}

@end
