//
//  SelectViewController.m
//  ShangTest
//
//  Created by len on 16/8/9.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "SelectViewController.h"
#import "SecondSelectViewController.h"
#import "SelectCollectionViewCell.h"


@interface SelectViewController ()

@property(strong,nonatomic)NSMutableArray *dataArray;
@property(strong,nonatomic)UICollectionView *collect;

@end

@implementation SelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.dataArray = [NSMutableArray arrayWithObjects:@"习题收藏",@"考试测试",@"认证考试",@"阶段复习",@"练习历史",@"人事65问",@"错题记录",@"企业面试",@"意见反馈",@"逻辑思维", nil];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initSubviews];
    
}

-(void)initSubviews
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 0.5;
    layout.minimumInteritemSpacing = 0.5;
    layout.itemSize = CGSizeMake((SCREEN_WIDTH-0.5)/2, 100);
//    layout.sectionInset = UIEdgeInsetsMake(-20, 0, 0, 0);
    
    self.collect = [[UICollectionView alloc]initWithFrame:CGRectMake(0,64, SCREEN_WIDTH, SCREEN_HEIGHT-64-49) collectionViewLayout:layout];
    _collect.delegate = self;
    _collect.dataSource = self;
    
    _collect.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_collect];
    
    [_collect registerNib:[UINib nibWithNibName:@"SelectCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return  _dataArray.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SelectCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    NSString *s = [NSString stringWithFormat:@"%ld",indexPath.row+1];
    cell.imageV.image = [UIImage imageNamed:s];
    
    cell.title.text = _dataArray[indexPath.row];
    
    
    UIView *v = [cell viewWithTag:100];
    if (indexPath.row % 2 == 1) {
        v.hidden = YES;
    }else
    {
        v.hidden = NO;
    }
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    SecondSelectViewController *viewController = [[SecondSelectViewController alloc]init];
    [self.navigationController pushViewController:viewController animated:YES];
}




@end
