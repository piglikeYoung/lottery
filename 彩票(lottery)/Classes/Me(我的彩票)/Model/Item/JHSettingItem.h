//
//  JHProductItem.h
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/19.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef  void (^optionBlcok)();

@interface JHSettingItem : NSObject

/**
 *  图标
 */
@property (nonatomic, copy) NSString *icon;
/**
 *  标题
 */
@property (nonatomic, copy) NSString *tilte;

/**
 *  记录客服电话
 */
@property (nonatomic, copy) NSString *subTitle;

// 定义block保存将来要执行的代码
@property (nonatomic, copy) optionBlcok option;

- (instancetype)initWithIcon:(NSString *)icon title:(NSString *)title;

@end
