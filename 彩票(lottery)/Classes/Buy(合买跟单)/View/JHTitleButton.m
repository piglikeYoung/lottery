//
//  JHTitleButton.m
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/18.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHTitleButton.h"

@interface JHTitleButton()

@property (nonatomic, strong) UIFont *myFont;


@end

@implementation JHTitleButton

- (id)initWithCoder:(NSCoder *)aDecoder
{
    
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    // 记录按钮标题的字体
    self.myFont = [UIFont systemFontOfSize:15];
    // 设置标题的字体
    self.titleLabel.font = self.myFont;
    // 设置按钮的图片显示的内容默认为居中(为了不拉伸)
    self.imageView.contentMode = UIViewContentModeCenter;
}

// 本方法是拿到TabBar上的titleButton的title，对它的位置重新设置
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleH = contentRect.size.height;// 原title多高，现在就有多高
    // 获取当前按钮上的文字
    NSString *title = self.currentTitle;
    CGSize maxSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
    NSMutableDictionary *md = [NSMutableDictionary dictionary];
    // 死循环的原因是self.titleLabel需要访问titleLabel, 而self.titleLabel又需要调用当前方法获取title的范围, 所有死循环
    //    md[NSFontAttributeName] = self.titleLabel.font;
    
    md[NSFontAttributeName] = self.myFont;
    // 计算文字的范围
    CGFloat titleW =  0;
    // 判断是否是xcode5 , 如果是就编译一下代码, 如果不是就不编译
#ifdef __IPHONE_7_0
    if (iOS7) { // 是IOS7
        CGRect titleRect = [title boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:md context:nil];
        titleW = titleRect.size.width;
    }else
    {
        // 非IOS7
        CGSize titleSize = [title sizeWithFont:self.myFont];
        titleW = titleSize.width;
    }
#else
    // XCODE4
    CGSize titleSize = [title sizeWithFont:self.myFont];
    titleW = titleSize.width;
#endif
    
    return CGRectMake(titleX, titleY, titleW, titleH);

}

// 本方法是拿到TabBar上的titleButton的image，对它的位置重新设置
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY = 0;
    CGFloat ImageH = contentRect.size.height;// 原本image多高，现在就多高
    CGFloat imageW = 16;
    // 图片的X = 按钮的宽度 - 图片宽度
    CGFloat imageX = contentRect.size.width - imageW;
    return CGRectMake(imageX, imageY, imageW, ImageH);
}

@end
