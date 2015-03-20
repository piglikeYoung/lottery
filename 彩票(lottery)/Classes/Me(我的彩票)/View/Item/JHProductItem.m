//
//  JHProductItem.m
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/19.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHProductItem.h"
#import "JHProduct.h"

@interface JHProductItem()

/**
 *  图标
 */
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
/**
 *  名称
 */
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;


@end

@implementation JHProductItem

// initWithCoder方法设置图片样式的时候，系统在调用完成后会将masksToBounds重新设置为NO
// 所以调用此方法无法剪切超出主图层部分
/*
 - (id)initWithCoder:(NSCoder *)aDecoder
 {
 if (self = [super initWithCoder:aDecoder]) {
 
 // 设置图片的主图层圆角
 self.iconView.layer.cornerRadius = 8;
 // 设置超出主图层的部分剪切
 //        self.iconView.clipsToBounds = YES;
 self.iconView.layer.masksToBounds = YES;
 NSLog(@"initWithCoder");
 }
 return self;
 }
 */

- (void)awakeFromNib {
    // 设置图片的主图层圆角
    self.iconView.layer.cornerRadius = 8;
    // 超出主图层的部分剪切
    self.iconView.clipsToBounds = YES;
}

-(void)setProduct:(JHProduct *)product
{
    _product = product;
    
    // 设置图标
    self.iconView.image = [UIImage imageNamed:self.product.icon];
    // 设置名称
    self.nameLabel.text = self.product.title;
}



@end
