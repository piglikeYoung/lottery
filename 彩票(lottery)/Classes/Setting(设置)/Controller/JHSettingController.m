//
//  JHSettingController.m
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/19.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHSettingController.h"
#import "JHProductGroup.h"
#import "JHProductItem.h"
#import "NJTestViewController.h"
#import "JHProductSwitchItem.h"
#import "JHProductCell.h"
#import "JHProductArrowItem.h"

@interface JHSettingController ()

@property (strong , nonatomic) NSMutableArray *datas;

@end

@implementation JHSettingController

#pragma mark - 懒加载
- (NSArray *)datas
{
    if (_datas == nil) {
        // 第一组
        JHProductItem *item00 = [[JHProductArrowItem alloc] initWithIcon:@"MorePush" title:@"推送和提醒" destClass:[NJTestViewController class]];
        JHProductItem *item01 = [[JHProductSwitchItem alloc] initWithIcon:@"MorePush" title:@"摇一摇机选" ];
        
        JHProductGroup *group1 = [[JHProductGroup alloc] init];
        group1.items = @[item00,item01];
        
        // 第2组数据
        JHProductItem *item10 = [[JHProductArrowItem alloc] initWithIcon:@"MorePush" title:@"检查新版本" destClass:[NJTestViewController class]];
        JHProductItem *item11 = [[JHProductSwitchItem alloc] initWithIcon:@"MorePush" title:@"帮助"];
        
        JHProductGroup *group2 = [[JHProductGroup alloc] init];
        group2.headerTitle = @"第2组的标题";
        group2.footerTitle = @"第2组的标题123456";
        group2.items = @[item10,item11];
        
        _datas = [NSMutableArray array];
        [_datas addObject:group1];
        [_datas addObject:group2];
    }
    return _datas;
}

- (id)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}
- (id)initWithStyle:(UITableViewStyle)style
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 先取出对应组的小数组
    JHProductGroup *g = self.datas[section];
    return g.items.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建cell
    JHProductCell *cell = [JHProductCell cellWithTableView:tableView];
    // 2.设置数据
    // 先取出对应组的组模型
    JHProductGroup *g = self.datas[indexPath.section];
    // 从组模型中取出对应行的模型
    JHProductItem *item = g.items[indexPath.row];
    
    cell.item = item;
    
    // 3.返回cell
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 先取出对应组的组模型
    JHProductGroup *g = self.datas[indexPath.section];
    //  从组模型中取出对应行的模型
    JHProductItem *item = g.items[indexPath.row];
    // 创建目标控制并且添加到栈中
    if ([item isKindOfClass:[JHProductArrowItem class]]) {
        JHProductArrowItem *arrowItem = (JHProductArrowItem *)item;
        UIViewController *vc = [[arrowItem.destVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // 先取出对应组的模型
    JHProductGroup *g = self.datas[section];
    return g.headerTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    // 先取出对应组的组模型
    JHProductGroup *g = self.datas[section];
    return g.footerTitle;
}



@end
