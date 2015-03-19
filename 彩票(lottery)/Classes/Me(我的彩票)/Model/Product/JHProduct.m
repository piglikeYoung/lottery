//
//  NJProduct.m
//  09-彩票(lottery)
//
//  Created by apple on 14-6-19.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "JHProduct.h"

@implementation JHProduct
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        // 模型中的属性必须和字典中的key一模一样
//        [self setValuesForKeysWithDictionary:dict];
        self.icon = dict[@"icon"];
        self.title = dict[@"title"];
    }
    return self;
}
+ (instancetype)productWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
