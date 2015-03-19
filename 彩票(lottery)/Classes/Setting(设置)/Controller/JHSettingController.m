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
#import "MBProgressHUD+NJ.h"

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
        JHProductItem *item10 = [[JHProductItem alloc] initWithIcon:@"MorePush" title:@"检查新版本"];
        item10.option = ^{
            // 模拟发送网络请求
            [MBProgressHUD showMessage:@"正在拼命检查..."];
            // 2秒之后删除提示
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUD];
                // 提示没有新版本
                [MBProgressHUD showSuccess:@"亲~没有新版本"];
            });
        };
        
        JHProductItem *item11 = [[JHProductArrowItem alloc] initWithIcon:@"MorePush" title:@"帮助" destClass:[NJTestViewController class]];
        
        JHProductGroup *group2 = [[JHProductGroup alloc] init];
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
    
    // 立即取消选中
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 先取出对应组的组模型
    JHProductGroup *g = self.datas[indexPath.section];
    //  从组模型中取出对应行的模型
    JHProductItem *item = g.items[indexPath.row];
    // 判断block中是否保存了代码
    if (item.option != nil) {
        // 如果保存，就执行block中保存的代码
        item.option();
    }else if ([item isKindOfClass:[JHProductArrowItem class]]) {
        // 创建目标控制并且添加到栈中
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
