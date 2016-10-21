//
//  DiscoverViewController.m
//  ShangTest
//
//  Created by mac on 16/9/22.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "DiscoverViewController.h"
#import "DiscoverCollectionViewCell.h"

#import "DiscoverHeadView.h"

@interface DiscoverViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(strong,nonatomic)UICollectionView *collectView;

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self initSubviewLayout];
    
    [self.view addSubview:_collectView];
}

-(void)initSubviewLayout
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH/3-2, SCREEN_WIDTH/3);
    flowLayout.minimumInteritemSpacing = 1;
    flowLayout.headerReferenceSize=CGSizeMake(self.view.frame.size.width,200);
    
    self.collectView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-49) collectionViewLayout:flowLayout];
    _collectView.delegate = self;
    _collectView.dataSource = self;
    
    _collectView.backgroundColor = [UIColor whiteColor];
    
    [_collectView registerNib:[UINib nibWithNibName:@"DiscoverCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
    
    [_collectView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head"];
    
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
    
    cell.name.text = @"李香园 Android开发 月薪10K";
    cell.company.text = @"北京惠天听书科技有限公司";
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader){
        
        reusableview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head" forIndexPath:indexPath];
        
        
        __weak UIView *head = reusableview;
        
        UILabel *title = [[UILabel alloc]init];
        title.text = @"公司领导莅临尚学堂专长招聘";
        title.font = [UIFont systemFontOfSize:19];
        title.textColor = [UIColor redColor];
        
        [head addSubview:title];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(head).offset(20);
            make.centerX.equalTo(head);
        }];
        
        NSArray *arr = @[@"北京融汇兴业网络技术有限公司",@"中数博阳信息技术有限公司",@"信达财产保险有限公司",@"中软通达（北京）科技有限公司",@"北京米花互动科技有限公司",@"北京万维通港科技有限公司",@"北京华夏迅联信息技术有限公司",@"北京盛华实科技有限公司"];
        
        int i = 1 ;
        UILabel *lastLabel , *l;
        for (NSString *s in arr) {
            l = [[UILabel alloc]init];
            l.text = [NSString stringWithFormat:@"%d.%@",i,s];
            l.font = [UIFont systemFontOfSize:13];
            [head addSubview:l];
            
            if (i == 1) {
                [l mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(title.bottom).offset(20);
                    make.left.equalTo(head).offset(5);
                }];
            }else if (i % 2 == 0) {
                if (i/2 == 1) {
                    [l mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.top.equalTo(title.bottom).offset(20);
                        make.left.equalTo(head).offset(SCREEN_WIDTH/2);
                    }];
                }else{
                    [l mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.top.equalTo(lastLabel.top);
                        make.left.equalTo(head).offset(SCREEN_WIDTH/2);
                    }];
                }
            }else
            {
                [l mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(lastLabel.bottom).offset(5);
                    make.left.equalTo(head).offset(5);
                }];
            }
            
            lastLabel = l;

            i++;
        }
        
//        [l mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.equalTo(head).offset(20);
//        }];


        
    }
    reusableview.backgroundColor = [UIColor yellowColor];
    
    return reusableview;
}

@end
