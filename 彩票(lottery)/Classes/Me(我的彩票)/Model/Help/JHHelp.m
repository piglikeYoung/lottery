//
//  JHHelp.m
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/20.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHHelp.h"

@implementation JHHelp

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.title = dict[@"title"];
        self.html = dict[@"html"];
        self.tagId = dict[@"id"];
    }
    return self;
}

+(instancetype)helpWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
