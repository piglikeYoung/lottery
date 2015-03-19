//
//  JHProductCell.h
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/19.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JHProductItem;

@interface JHProductCell : UITableViewCell

@property (nonatomic, strong) JHProductItem *item;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
