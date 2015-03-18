//
//  JHTabBar.h
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/18.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  JHTabBarDelegate <NSObject>

/**
 *  @param from 从哪个视图(视图索引)
 *  @param to   到哪个视图(视图索引)
 */
- (void)tabBarDidSelectBtnFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface JHTabBar : UIView

@property (weak , nonatomic) id<JHTabBarDelegate> delegate;

@end
