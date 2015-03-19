//
//  JHProductArrowItem.h
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/19.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHProductItem.h"

@interface JHProductArrowItem : JHProductItem

/**
 *  目标控制器
 */
@property (nonatomic, assign) Class destVC;

- (instancetype)initWithIcon:(NSString *)icon title:(NSString *)title destClass:(Class)destVc;

@end
