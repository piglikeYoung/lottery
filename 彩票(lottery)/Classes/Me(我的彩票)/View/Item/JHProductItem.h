//
//  JHProductItem.h
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/19.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JHProduct;

@interface JHProductItem : UICollectionViewCell

/**
 *  接收外界传入的模型
 */
@property (nonatomic, strong) JHProduct *product;

@end
