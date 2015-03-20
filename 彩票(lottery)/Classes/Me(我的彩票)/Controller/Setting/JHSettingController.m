//
//  JHSettingController.m
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/19.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHSettingController.h"
#import "JHPushNoticeController.h"
#import "MBProgressHUD+NJ.h"
#import "JHProductViewController.h"
#import "JHHelpViewController.h"
#import "JHAboutViewController.h"
#import "JHShareViewController.h"

@interface JHSettingController ()


@end

@implementation JHSettingController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self add0SectionItems];
    [self add1SectionItems];
}


#pragma mark 添加第0组的模型数据
- (void)add0SectionItems
{
    // 1.1.推送和提醒
    JHSettingArrowItem *push = [[JHSettingArrowItem alloc]initWithIcon:@"MorePush" title:@"推送和提醒" destClass:[JHPushNoticeController class]];
    
    // 1.2.摇一摇机选
    JHSettingSwitchItem *shake = [[JHSettingSwitchItem alloc ]initWithIcon:@"handShake" title:@"摇一摇机选"];
    
    // 1.3.声音效果
    JHSettingSwitchItem *sound = [[JHSettingSwitchItem alloc] initWithIcon:@"sound_Effect" title:@"声音效果"];
    
    JHSettingGroup *group = [[JHSettingGroup alloc] init];
    group.items = @[push, shake, sound];
    [self.datas addObject:group];
}
#pragma mark 添加第1组的模型数据
- (void)add1SectionItems
{
    // 2.1.检查新版本
    JHSettingArrowItem *update = [[JHSettingArrowItem alloc ]initWithIcon:@"MoreUpdate" title:@"检查新版本"];
    update.option = ^{
        // 模拟发送网络请求
        [MBProgressHUD showMessage:@"正在拼命检查..."];
        // 2秒之后删除提示
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUD];
            // 提示没有新版本
            [MBProgressHUD showSuccess:@"亲~没有新版本"];
        });
    };
    
    // 2.2.帮助
    JHSettingArrowItem *help = [[JHSettingArrowItem alloc ]initWithIcon:@"MoreHelp" title:@"帮助" destClass:[JHHelpViewController class]];
    
    
    // 2.3.分享
    JHSettingArrowItem *share = [[JHSettingArrowItem alloc ]initWithIcon:@"MoreShare" title:@"分享"destClass:[JHShareViewController class]];
    
    
    // 2.4.查看消息
    JHSettingArrowItem *msg = [[JHSettingArrowItem alloc ]initWithIcon:@"MoreMessage" title:@"查看消息"];
    
    // 2.5.产品推荐
    JHSettingArrowItem *product = [[JHSettingArrowItem alloc ]initWithIcon:@"MoreNetease" title:@"产品推荐" destClass: [JHProductViewController class]];
    
    // 2.6.关于
    JHSettingArrowItem *about = [[JHSettingArrowItem alloc ]initWithIcon:@"MoreAbout" title:@"关于"destClass : [JHAboutViewController class]];
    
    JHSettingGroup *group = [[JHSettingGroup alloc] init ];
    group.items = @[update, help, share, msg, product, about];
    [self.datas addObject:group];
}


@end
