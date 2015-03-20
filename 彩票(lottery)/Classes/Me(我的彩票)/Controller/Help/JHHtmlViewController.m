//
//  JHHtmlViewController.m
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/20.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHHtmlViewController.h"
#import "JHHelp.h"

@interface JHHtmlViewController ()<UIWebViewDelegate>

@end

@implementation JHHtmlViewController

-(void)loadView
{
    self.view = [[UIWebView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // 1.设置标题
    self.title = self.helpModel.title;

    // 2.添加关闭按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(closeVc)];

    // 3.利用自定义的webView加载网页
    UIWebView *webView = (UIWebView *)self.view;

    webView.delegate = self;

    // 3.1获取网页的全路径
    NSString *path = [[NSBundle mainBundle] pathForResource:self.helpModel.html ofType:nil];
    // 3.2根据全路径创建url
    NSURL *url = [[NSURL alloc] initFileURLWithPath:path];
    // 3.2根据url创建request
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    // 3.4加载本地网页
    [webView loadRequest:request];
}

#pragma mark - UIWebViewDelegate
// 网页加载完毕之后调用
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    // 当网页加载完毕之后执行javascript代码,跳转到对应的位置

    // 1.生成对应的javascript代码
    NSString *jsStr = [NSString stringWithFormat:@"window.location.href = '#%@';",self.helpModel.tagId];

    [webView stringByEvaluatingJavaScriptFromString:jsStr];
}

- (void)closeVc
{
    [self dismissViewControllerAnimated:YES completion:^{

    }];
}


@end
