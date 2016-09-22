//
//  DiscoverViewController.m
//  ShangTest
//
//  Created by mac on 16/9/22.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "DiscoverViewController.h"
#import "DiscoverCollectionViewCell.h"

@interface DiscoverViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(strong,nonatomic)UICollectionView *collectView;

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH/3-2, SCREEN_WIDTH/3);
    flowLayout.minimumInteritemSpacing = 1;
    
    self.collectView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-49) collectionViewLayout:flowLayout];
    _collectView.delegate = self;
    _collectView.dataSource = self;
    
    _collectView.backgroundColor = [UIColor whiteColor];
    
    [_collectView registerNib:[UINib nibWithNibName:@"DiscoverCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
    
    
    [self.view addSubview:_collectView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 11;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DiscoverCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    
    
    return cell;
}
@end
