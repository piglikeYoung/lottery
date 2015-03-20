//
//  JHHelp.h
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/20.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHHelp : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *html;
@property (nonatomic, copy) NSString *tagId;


- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)helpWithDict:(NSDictionary *)dict;

@end
