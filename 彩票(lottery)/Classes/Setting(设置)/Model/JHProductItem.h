//
//  JHProductItem.h
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/19.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHProductItem : NSObject

/**
 *  图标
 */
@property (nonatomic, copy) NSString *icon;
/**
 *  标题
 */
@property (nonatomic, copy) NSString *tilte;

- (instancetype)initWithIcon:(NSString *)icon title:(NSString *)title;

@end
