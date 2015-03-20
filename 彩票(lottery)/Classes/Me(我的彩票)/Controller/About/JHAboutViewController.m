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

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation JHAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JHSettingItem *item00 = [[JHSettingArrowItem alloc] initWithIcon:nil title:@"评分支持"];
    item00.option = ^{
        NSString *appid = @"717804289";
        NSString *str = [NSString stringWithFormat:
                         @"itms-apps://itunes.apple.com/cn/app/id%@?mt=8", appid];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
        
    };
    
    JHSettingItem *item01 = [[JHSettingArrowItem alloc] initWithIcon:nil title:@"客服电话"];
    
    item01.subTitle = @"123456789";
    item01.option = ^{
        // 打电话
        // 弊端:使用该方法进行拨号之后,当电话挂断之后不会返回应用程序, 会停留在通话记录界面
        //        NSURL *url = [NSURL URLWithString:@"tel://13261936021"];
        //        [[UIApplication sharedApplication] openURL:url];
        
        // 在拨打电话之后会提示用户是否拨打, 当电话挂断之后会返回应用程序
        //        NSURL *url = [NSURL URLWithString:@"telprompt://13261936021"];
        //        [[UIApplication sharedApplication] openURL:url];
        
        if (_webView == nil) {
            _webView = [[UIWebView alloc] initWithFrame:CGRectZero];
        }
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"tel://13261936021"]]];
    };
    
    JHSettingGroup *group = [[JHSettingGroup alloc] init];
    group.items = @[item00,item01];
    [self.datas addObject:group];
    
    self.tableView.tableHeaderView = [JHAboutHeaderView headerView];
}

@end
