//
//  JHShareViewController.m
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/20.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHShareViewController.h"

@interface JHShareViewController ()

@end

@implementation JHShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    // 1.1.新浪微博
    JHSettingArrowItem *weibo = [[JHSettingArrowItem alloc] initWithIcon:@"WeiboSina" title:@"新浪微博"];
    
    // 1.2.短信分享
    JHSettingArrowItem *sms = [[JHSettingArrowItem  alloc ]initWithIcon:@"SmsShare" title:@"短信分享"];
    
    // 1.3.邮件分享
    JHSettingArrowItem *mail = [[JHSettingArrowItem alloc] initWithIcon:@"MailShare" title:@"邮件分享"];
    
    JHSettingGroup *group = [[JHSettingGroup alloc]init];
    group.items = @[weibo, sms, mail];
    
    [self.datas addObject:group];
}


@end
