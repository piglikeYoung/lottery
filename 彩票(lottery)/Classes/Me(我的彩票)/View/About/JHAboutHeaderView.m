//
//  JHAboutHeaderView.m
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/20.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHAboutHeaderView.h"

@implementation JHAboutHeaderView

+(instancetype)headerView
{
    return [[NSBundle mainBundle] loadNibNamed:@"JHAboutHeaderView" owner:nil options:nil][0];
}

@end
