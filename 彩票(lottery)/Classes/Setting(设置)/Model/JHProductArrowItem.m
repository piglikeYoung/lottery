//
//  JHProductArrowItem.m
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/19.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHProductArrowItem.h"

@implementation JHProductArrowItem

-(instancetype)initWithIcon:(NSString *)icon title:(NSString *)title destClass:(Class)destVc
{
    if (self = [super initWithIcon:icon title:title]) {
        self.destVC = destVc ;
    }
    
    return self;
}


@end
