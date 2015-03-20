//
//  JHBaseViewController.h
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/20.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHSettingGroup.h"
#import "JHSettingItem.h"
#import "JHSettingSwitchItem.h"
#import "JHSettingCell.h"
#import "JHSettingArrowItem.h"
#import "JHSettingLabelItem.h"

@interface JHBaseViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *datas;

@end
