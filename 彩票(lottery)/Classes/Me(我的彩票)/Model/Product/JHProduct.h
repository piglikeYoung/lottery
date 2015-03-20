//
//  NJProduct.h
//  09-彩票(lottery)
//
//  Created by apple on 14-6-19.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHProduct : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *icon;
// scheme + identifier是用于打开其它应用程序的
@property (nonatomic, copy) NSString *scheme; //  customUrl
@property (nonatomic, copy) NSString *identifier; // id
// url是用于打开appstore 的
@property (nonatomic, copy) NSString *url; // url

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)productWithDict:(NSDictionary *)dict;
@end
