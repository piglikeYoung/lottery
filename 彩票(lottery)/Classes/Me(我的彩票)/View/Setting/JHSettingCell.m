//
//  JHProductCell.m
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/19.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHSettingCell.h"
#import "JHSettingItem.h"
#import "JHSettingArrowItem.h"
#import "JHSettingSwitchItem.h"

@interface JHSettingCell()

@property (nonatomic, strong) UIImageView *arrowIv;
@property (nonatomic, strong) UISwitch *switchBtn;
@property (strong , nonatomic) UILabel *labelView;

@end

@implementation JHSettingCell

-(UIImageView *)arrowIv
{
    if (_arrowIv == nil) {
        _arrowIv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    
    return _arrowIv;
}

-(UISwitch *)switchBtn
{
    if (_switchBtn == nil) {
        _switchBtn = [[UISwitch alloc] init];
    }
    
    return _switchBtn;
}

- (UILabel *)labelView
{
    if (_labelView == nil) {
        _labelView = [[UILabel alloc] init];
        _labelView.frame = CGRectMake(250, 0, 100, 44);
        _labelView.backgroundColor = [UIColor redColor];
    }
    return _labelView;
}

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"cell";
    JHSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[JHSettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}

-(void)setItem:(JHSettingItem *)item
{
    _item = item;
    
    // 设置数据
    self.textLabel.text = _item.tilte;
    self.imageView.image = [UIImage imageNamed:_item.icon];
    
    // 设置辅助视图
    if ([_item isKindOfClass:[JHSettingArrowItem class]]) {
        // 利用懒加载创建，因为这个set方法频繁调用，不使用懒加载就会频繁的创建控件，但是控件是一样的，所以通过懒加载来一次创建，多次使用
        self.accessoryView = self.arrowIv;
    }else if ([_item isKindOfClass:[JHSettingSwitchItem class]]){
        self.accessoryView = self.switchBtn;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }else if ([_item isKindOfClass:[JHSettingLabelItem class]]){
        self.accessoryView = self.labelView;
    }else{
        self.accessoryView = nil;
    }
}

@end
