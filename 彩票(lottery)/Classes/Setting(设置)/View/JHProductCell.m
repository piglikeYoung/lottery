//
//  JHProductCell.m
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/19.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHProductCell.h"
#import "JHProductItem.h"
#import "JHProductArrowItem.h"
#import "JHProductSwitchItem.h"

@interface JHProductCell()

@property (nonatomic, strong) UIImageView *arrowIv;
@property (nonatomic, strong) UISwitch *switchBtn;

@end

@implementation JHProductCell

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

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"cell";
    JHProductCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[JHProductCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}

-(void)setItem:(JHProductItem *)item
{
    _item = item;
    
    // 设置数据
    self.textLabel.text = _item.tilte;
    self.imageView.image = [UIImage imageNamed:_item.icon];
    
    // 设置辅助视图
    if ([_item isKindOfClass:[JHProductArrowItem class]]) {
        // 利用懒加载创建，因为这个set方法频繁调用，不使用懒加载就会频繁的创建控件，但是控件是一样的，所以通过懒加载来一次创建，多次使用
        self.accessoryView = self.arrowIv;
    }else if ([_item isKindOfClass:[JHProductSwitchItem class]]){
        self.accessoryView = self.switchBtn;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }else{
        self.accessoryView = nil;
    }
}

@end
