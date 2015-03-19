//
//  JHProductViewController.m
//  彩票(lottery)
//
//  Created by piglikeyoung on 15/3/19.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHProductViewController.h"
#import "JHProduct.h"
#import "JHProductItem.h"

#define JHIdentifier  @"COLLECTION"

@interface JHProductViewController ()

// 定义数组保存所有产品模型
@property (strong , nonatomic) NSArray *products;

@end

@implementation JHProductViewController

#pragma mark - 懒加载
- (NSArray *)products
{
    if (_products == nil) {
        // 1.加载json中的数据
        // 2.将json中的数据转换为模型
        // 2.1获取json文件的全路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"product.json" ofType:nil];
        // 2.2根据全路径加载json文件到nsdata中
        NSData *data = [NSData dataWithContentsOfFile:path];
        // 2.3将加载进来的nsdata数据转换为OC中对应的对象
        NSArray *dictArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
        // 3.将转换后的数据传递给products
        NSMutableArray *models = [NSMutableArray arrayWithCapacity:dictArray.count];
        for (NSDictionary *dict in dictArray) {
            JHProduct *product = [JHProduct productWithDict:dict];
            [models addObject:product];
        }
        _products = models;
    }
    // 4.返回products
    return _products;
}

#pragma mark - 初始化方法
-(instancetype)init
{
    //    UICollectionViewLayout 布局对象决定了将来CollectionView上每一个Cell显示的方式
    // 创建一个布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 设置每一个cell的宽高 (cell在CollectionView中称之为item)
    layout.itemSize = CGSizeMake(80, 80);
    // 设置item行与行之间的间隙
    layout.minimumLineSpacing = 10;
    // 设置item列与列之间的间隙
    layout.minimumInteritemSpacing = 0;
    // 设置CollectionView距离上边
    //    layout.headerReferenceSize = CGSizeMake(0, 100);
    //    layout.footerReferenceSize = CGSizeMake(0, 200);
    
    // 设置CollectionView内容部分距离控制器view上下左右的边距
    // 上/左/下/右
    layout.sectionInset = UIEdgeInsetsMake(layout.minimumLineSpacing, 0, 0, 0);
    
    // 在初始化的时候传入自己创建的布局对象
    if (self = [super initWithCollectionViewLayout:layout]) {
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"产品推荐";
    
    // 告诉系统将来需要创建什么样的cell(在获取cell之前必须先注册一个cell到系统中)
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:JHIdentifier];
    
    // 如果item(cell) 是从xib描述的, 就要先注册xib
    UINib *nib = [UINib nibWithNibName:@"JHProductItem" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:JHIdentifier];
    
    // 设置控制器view的背景颜色
    self.collectionView.backgroundColor = [UIColor whiteColor];
}


#pragma mark <UICollectionViewDataSource>
// 告诉系统一共有多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 告诉系统第section组有多少行
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // 从缓存池中获取cell
    JHProductItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:JHIdentifier forIndexPath:indexPath];
    
    // 2.设置数据
    cell.product = self.products[indexPath.item];
    
    // 3.返回cell
    return cell;
}



#pragma mark- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.获取点击的那一个item对应的模型
    JHProduct *product = self.products[indexPath.item];
    NSLog(@"%@",  product.title);
}



@end
