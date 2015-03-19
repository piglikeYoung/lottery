//
//  JHSettingController.m
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/19.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHSettingController.h"
#import "JHSettingGroup.h"
#import "JHSettingItem.h"
#import "NJTestViewController.h"
#import "JHSettingSwitchItem.h"
#import "JHSettingCell.h"
#import "JHSettingArrowItem.h"
#import "MBProgressHUD+NJ.h"
#import "JHProductViewController.h"

@interface JHSettingController ()

@property (strong , nonatomic) NSMutableArray *datas;

@end

@implementation JHSettingController

#pragma mark - 懒加载
- (NSArray *)datas
{
    if (_datas == nil) {
        _datas = [NSMutableArray array];
        [self add0SectionItems];
        [self add1SectionItems];
    }
    return _datas;
}

#pragma mark 添加第0组的模型数据
- (void)add0SectionItems
{
    // 1.1.推送和提醒
    JHSettingArrowItem *push = [[JHSettingArrowItem alloc]initWithIcon:@"MorePush" title:@"推送和提醒"];
    
    // 1.2.摇一摇机选
    JHSettingSwitchItem *shake = [[JHSettingSwitchItem alloc ]initWithIcon:@"handShake" title:@"摇一摇机选"];
    
    // 1.3.声音效果
    JHSettingSwitchItem *sound = [[JHSettingSwitchItem alloc] initWithIcon:@"sound_Effect" title:@"声音效果"];
    
    JHSettingGroup *group = [[JHSettingGroup alloc] init];
    group.items = @[push, shake, sound];
    [_datas addObject:group];
}
#pragma mark 添加第1组的模型数据
- (void)add1SectionItems
{
    // 2.1.检查新版本
    JHSettingArrowItem *update = [[JHSettingArrowItem alloc ]initWithIcon:@"MoreUpdate" title:@"检查新版本"];
    update.option = ^{
        // 模拟发送网络请求
        [MBProgressHUD showMessage:@"正在拼命检查..."];
        // 2秒之后删除提示
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUD];
            // 提示没有新版本
            [MBProgressHUD showSuccess:@"亲~没有新版本"];
        });
    };
    
    // 2.2.帮助
    JHSettingArrowItem *help = [[JHSettingArrowItem alloc ]initWithIcon:@"MoreHelp" title:@"帮助"];
    
    
    // 2.3.分享
    JHSettingArrowItem *share = [[JHSettingArrowItem alloc ]initWithIcon:@"MoreShare" title:@"分享"];
    
    
    // 2.4.查看消息
    JHSettingArrowItem *msg = [[JHSettingArrowItem alloc ]initWithIcon:@"MoreMessage" title:@"查看消息"];
    
    // 2.5.产品推荐
    JHSettingArrowItem *product = [[JHSettingArrowItem alloc ]initWithIcon:@"MoreNetease" title:@"产品推荐" destClass: [JHProductViewController class]];
    
    // 2.6.关于
    JHSettingArrowItem *about = [[JHSettingArrowItem alloc ]initWithIcon:@"MoreAbout" title:@"关于"];
    
    JHSettingGroup *group = [[JHSettingGroup alloc] init ];
    group.items = @[update, help, share, msg, product, about];
    [_datas addObject:group];
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
