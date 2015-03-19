//
//  JHProductGroup.h
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/19.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHProductGroup : NSObject

/**
 *   头部标题
 */
@property (nonatomic, copy) NSString *headerTitle;
/**
 *  底部标题
 */
@property (nonatomic, copy) NSString *footerTitle;
/**
 *  当前分组中所有行的数据(保存的是NJProductItem模型)
 */
@property (nonatomic, strong) NSArray *items;

@end
