//
//  JHShareViewController.m
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/20.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHShareViewController.h"
#import <MessageUI/MessageUI.h>

@interface JHShareViewController ()<MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate>

@end

@implementation JHShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    // 1.1.新浪微博
    JHSettingArrowItem *weibo = [[JHSettingArrowItem alloc] initWithIcon:@"WeiboSina" title:@"新浪微博"];
    
    // 1.2.短信分享
    JHSettingArrowItem *sms = [[JHSettingArrowItem  alloc ]initWithIcon:@"SmsShare" title:@"短信分享"];
    
    sms.option = ^{
        // 如果利用该方式发送短信, 当短信发送完毕或者取消之后不会返回应用程序
        //        NSURL *url = [NSURL URLWithString:@"sms://10010"];
        //        [[UIApplication sharedApplication] openURL:url];
        
        // 判断当前设备能否发送短信
        if (![MFMessageComposeViewController canSendText]) {
            NSLog(@"当前设备不能发送短信");
            return ;
        }
        
        MFMessageComposeViewController *vc = [[MFMessageComposeViewController alloc] init];
        // 设置短信内容
        vc.body = @"吃饭了没？";
        // 设置收件人列表
        vc.recipients = @[@"10010"];
        // 设置代理
        vc.messageComposeDelegate = self;
        // 显示控制器
        [self presentViewController:vc animated:YES completion:nil];
    };
    
    // 1.3.邮件分享
    JHSettingArrowItem *mail = [[JHSettingArrowItem alloc] initWithIcon:@"MailShare" title:@"邮件分享"];
    
    mail.option = ^{
        // 当邮件发送成功或者失败或者取消之后不会回到原来的应用程序
        //        NSURL *url = [NSURL URLWithString:@"mailto://10010@qq.com"];
        //        [[UIApplication sharedApplication] openURL:url];
        
        
        // 不能发邮件
        if (![MFMailComposeViewController canSendMail]) return;
        
        // 当邮件发送成功或者失败或者取消之后会回到原始程序
        MFMailComposeViewController *vc = [[MFMailComposeViewController alloc] init];
        
        // 设置邮件主题
        [vc setSubject:@"会议"];
        // 设置邮件内容
        [vc setMessageBody:@"今天下午开会吧" isHTML:NO];
        // 设置收件人列表
        [vc setToRecipients:@[@"643055866@qq.com"]];
        // 设置抄送人列表
        [vc setCcRecipients:@[@"1234@qq.com"]];
        // 设置密送人列表
        [vc setBccRecipients:@[@"56789@qq.com"]];
        
        // 添加附件（一张图片）
        UIImage *image = [UIImage imageNamed:@"lufy.jpeg"];
        NSData *data = UIImageJPEGRepresentation(image, 0.5);
        [vc addAttachmentData:data mimeType:@"image/jepg" fileName:@"lufy.jpeg"];
        
        // 设置代理
        vc.mailComposeDelegate = self;
        // 显示控制器
        [self presentViewController:vc animated:YES completion:nil];
        
        
    };
    
    JHSettingGroup *group = [[JHSettingGroup alloc]init];
    group.items = @[weibo, sms, mail];
    
    [self.datas addObject:group];
}

#pragma mark - MFMailComposeViewControllerDelegate
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    // 关闭邮件界面
    [controller dismissViewControllerAnimated:YES completion:nil];
    
    if (result == MFMailComposeResultCancelled) {
        NSLog(@"取消发送");
    } else if (result == MFMailComposeResultSent) {
        NSLog(@"已经发出");
    } else {
        NSLog(@"发送失败");
    }
}


#pragma mark - MFMessageComposeViewController
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    NSLog(@"didFinishWithResult");
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
    if (MessageComposeResultCancelled == result) {
        NSLog(@"取消发送");
    }else if (MessageComposeResultSent == result)
    {
        NSLog(@"发送成功");
    }else
    {
        NSLog(@"发送失败");
    }
}


@end
