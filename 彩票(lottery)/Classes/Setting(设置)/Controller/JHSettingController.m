//
//  JHSettingController.m
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/18.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHSettingController.h"

@interface JHSettingController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;


@end

@implementation JHSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"RedButton"];
    // 通过一张原始图片生成一张可拉伸的图片
    CGFloat imageW = image.size.width * 0.5;
    CGFloat imageH = image.size.height * 0.5;
    UIImage *newImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(imageH, imageW, imageH, imageW) resizingMode:UIImageResizingModeStretch];
    [self.loginBtn setBackgroundImage:newImage forState:UIControlStateNormal];
    
    UIImage *selImage = [UIImage imageNamed:@"RedButtonPressed"];
    CGFloat selImageW = selImage.size.width * 0.5;
    CGFloat selImageH = selImage.size.height * 0.5;
    UIImage *selNewImage = [selImage resizableImageWithCapInsets:UIEdgeInsetsMake(selImageH, selImageW, selImageH, selImageW) resizingMode:UIImageResizingModeStretch];
    [self.loginBtn setBackgroundImage:selNewImage forState:UIControlStateHighlighted];
}

@end
