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

@end

@implementation SelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.dataArray = [NSMutableArray arrayWithObjects:@"sdf",@"df",@"fgs",@"hgfs", nil];
    
    [self initSubviews];
    
}

-(void)initSubviews
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 0.5;
    layout.minimumInteritemSpacing = 0.5;
    layout.itemSize = CGSizeMake((SCREEN_WIDTH-0.5)/2, 100);
    
    UICollectionView *collect = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-49) collectionViewLayout:layout];
    collect.delegate = self;
    collect.dataSource = self;
    
    collect.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:collect];
    
    [collect registerNib:[UINib nibWithNibName:@"SelectCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    
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
    
    
    cell.backgroundColor = [UIColor yellowColor];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    SecondSelectViewController *viewController = [[SecondSelectViewController alloc]init];
    [self.navigationController pushViewController:viewController animated:YES];
}


@end
