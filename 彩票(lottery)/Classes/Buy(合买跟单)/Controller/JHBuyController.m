//
//  JHBuyController.m
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/18.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHBuyController.h"
#import "JHTitleButton.h"

@interface JHBuyController ()
- (IBAction)titleBtnClick:(UIButton *)titleBtn;

// 定义变量记录当前按钮的状态
@property (nonatomic, assign, getter = isOpen) BOOL open;

@property (nonatomic, weak) UIView *contentView;

@end

@implementation JHBuyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加将来需要显示的view
    UIView *contentView = [[UIView alloc] init];
    contentView.backgroundColor = [UIColor purpleColor];
    contentView.frame = CGRectMake(0, 64, 320, 200);
    [self.view addSubview:contentView];
    self.contentView = contentView;
    // 隐藏该view
    contentView.hidden = YES;
}

- (IBAction)titleBtnClick:(UIButton *)titleBtn {
    
    if (!self.isOpen) {// 没有打开
        [UIView animateWithDuration:1.0 animations:^{
            // 1.旋转按钮上的尖尖
            titleBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI);
        }];
        
        // 改变当前按钮的状态
        self.open = YES;
        
        // 显示内容view
        self.contentView.hidden = NO;
    } else {
        [UIView animateWithDuration:1.0 animations:^{
            // 1.旋转按钮上的尖尖
            titleBtn.imageView.transform = CGAffineTransformIdentity;
        }];
        // 改变当前按钮的状态
        self.open = NO;
        
        // 隐藏内容View
        self.contentView.hidden = YES;
    }
}
@end
