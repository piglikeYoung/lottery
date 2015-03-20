//
//  JHHelpViewController.m
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/20.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHHelpViewController.h"
#import "JHHtmlViewController.h"
#import "JHHelp.h"

@interface JHHelpViewController ()

/**
 *   保存所有的json对象
 */
@property (nonatomic, strong) NSArray *helps;

@end

@implementation JHHelpViewController

#pragma mark - 懒加载
- (NSArray *)helps
{
    if (_helps == nil) {
        NSString *fullPath = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:fullPath];
        NSArray *dictArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
        NSMutableArray *models = [[NSMutableArray alloc] initWithCapacity:dictArray.count];
        
        for (NSDictionary *dict in dictArray) {
            JHHelp *help = [JHHelp helpWithDict:dict];
            [models addObject:help];
        }
        self.helps = [models copy];
    }
    return _helps;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 定义数组保存创建好的item模型
    NSMutableArray *items = [NSMutableArray arrayWithCapacity:self.helps.count];
    
    // 根据我们通过json创建的对象创建item
    for (JHHelp *help in self.helps) {
        JHSettingItem *item = [[JHSettingArrowItem alloc] initWithIcon:nil title:help.title destClass:nil];
        [items addObject:item];
    }
    
    // 创建分组
    JHSettingGroup *group = [[JHSettingGroup alloc] init];
    // 将所有的item赋值给分组items
    group.items = items;
    [self.datas addObject:group];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.创建目标控制器
    JHHtmlViewController *htmlVc = [[JHHtmlViewController alloc] init];
    // 1.2传递要显示的html名称
    htmlVc.helpModel = self.helps[indexPath.row];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:htmlVc];
    
    // 2.以模态的形式展示目标控制器
    [self presentViewController:nav animated:YES completion:^{
        
    }];
}

@end
