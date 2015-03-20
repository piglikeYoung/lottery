//
//  JHBaseViewController.m
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/20.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHBaseViewController.h"
#import "NJTestViewController.h"

@interface JHBaseViewController ()

@end

@implementation JHBaseViewController

#pragma mark - 懒加载
- (NSArray *)datas
{
    if (_datas == nil) {
        _datas = [NSMutableArray array];
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
    JHSettingGroup *g = self.datas[section];
    // 返回小数组的长度
    return g.items.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建cell
    JHSettingCell *cell = [JHSettingCell cellWithTableView:tableView];
    // 2.设置数据
    // 先取出对应组的组模型
    JHSettingGroup *g = self.datas[indexPath.section];
    // 从组模型中取出对应行的模型
    JHSettingItem *item = g.items[indexPath.row];
    
    cell.item = item;
    
    // 3.返回cell
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 立即取消选中
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 先取出对应组的组模型
    JHSettingGroup *g = self.datas[indexPath.section];
    //  从组模型中取出对应行的模型
    JHSettingItem *item = g.items[indexPath.row];
    // 判断block中是否保存了代码
    if (item.option != nil) {
        // 如果保存，就执行block中保存的代码
        item.option();
    }else if ([item isKindOfClass:[JHSettingArrowItem class]]) {
        // 创建目标控制并且添加到栈中
        JHSettingArrowItem *arrowItem = (JHSettingArrowItem *)item;
        UIViewController *vc = [[arrowItem.destVC alloc] init];
        // 设置目标控制器导航条的标题
        vc.title = arrowItem.tilte;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // 先取出对应组的模型
    JHSettingGroup *g = self.datas[section];
    return g.headerTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    // 先取出对应组的组模型
    JHSettingGroup *g = self.datas[section];
    return g.footerTitle;
}

@end
