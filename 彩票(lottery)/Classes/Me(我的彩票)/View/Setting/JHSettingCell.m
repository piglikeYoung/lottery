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
@property (nonatomic, weak) UIView *divider;

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
        
        // 监听开关的改变
        [_switchBtn addTarget:self action:@selector(switchBtnChagne) forControlEvents:UIControlEventValueChanged];
    }
    
    return _switchBtn;
}

// 偏好设置switch的状态
- (void)switchBtnChagne
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setBool:self.switchBtn.isOn forKey:self.item.tilte];
    
    [defaults synchronize];
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
        cell = [[JHSettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    return cell;
}

// 重写本方法，修改cell的选中时的颜色，用于适配iOS6、7
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 初始化操作
        // 1.设置背景颜色
        [self setupBackground];
        
        // 2. 清空子控件
        [self clearSubView];
        
        // 设置cell的宽度和屏幕一样宽
        //        self.frame = CGRectMake(0, 0, 1320, 44);
        
        // 3.添加分割线
        [self addDivider];
    }
    
    return self;
}

- (void)addDivider
{
    if (!iOS7) {
        UIView *divider = [[UIView alloc] init];
        divider.backgroundColor = [UIColor blackColor];
        [self.contentView addSubview:divider];
        divider.alpha = 0.4;
        self.divider = divider;
    }
}

- (void)clearSubView
{
    // 3.清空子视图的背景颜色
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.detailTextLabel.backgroundColor = [UIColor clearColor];
}

- (void)setupBackground
{
    // 1.设置cell选中状态的背景颜色
    UIView *selView = [[UIView alloc] init];
    selView.backgroundColor = JHColor(232, 228, 209);
    self.selectedBackgroundView = selView;
    // 2.设置cell默认状态的背景颜色
    UIView *norView = [[UIView alloc] init];
    norView.backgroundColor = [UIColor whiteColor];
    self.backgroundView = norView;
}

// cell的frame是系统管理的, 系统会自动给cell设置frame
// 重写该方法拦截系统设置的cell,自定义cellframe
- (void)setFrame:(CGRect)frame
{
    //    NSLog(@"setFrame = %@", NSStringFromCGRect(frame));
    if (!iOS7) {
        // 修改cell的宽度
        frame.size.width += 20;
        frame.origin.x -= 10;
    }
    [super setFrame:frame];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat dividerX = 0;
    //    CGFloat dividerW = self.contentView.frame.size.width;
    CGFloat dividerW = [UIScreen mainScreen].bounds.size.width;
    CGFloat dividerH = 1;
    CGFloat dividerY = self.contentView.frame.size.height - dividerH;
    
    self.divider.frame = CGRectMake(dividerX, dividerY, dividerW, dividerH);
    
    //  NSLog(@"setFrame = %@", NSStringFromCGRect(self.contentView.frame));
}

- (void)setHiddenLastDivider:(BOOL)hiddenLastDivider
{
    self.divider.hidden = hiddenLastDivider;
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
        self.detailTextLabel.text = item.subTitle;
        
    }else if ([_item isKindOfClass:[JHSettingSwitchItem class]]){
        self.accessoryView = self.switchBtn;
        
        // 恢复存储状态
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        self.switchBtn.on = [defaults boolForKey:self.item.tilte];
        // 设置没有选中样式
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }else if ([_item isKindOfClass:[JHSettingLabelItem class]]){
        self.accessoryView = self.labelView;
    }else{
        self.accessoryView = nil;
    }
}

@end
