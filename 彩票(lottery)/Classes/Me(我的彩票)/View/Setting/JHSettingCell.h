//
//  JHProductCell.h
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/19.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JHSettingItem;

@interface JHSettingCell : UITableViewCell

@property (nonatomic, strong) JHSettingItem *item;

@property (nonatomic, assign) BOOL hiddenLastDivider;

+ (instancetype)cellWithTableView:(UITableView *)tableView;



@end
