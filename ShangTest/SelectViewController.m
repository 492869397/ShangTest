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
#import "TopicCollectViewController.h"
#import "PracticeHistoryViewController.h"
#import "ErrorRecordViewController.h"
#import "CompanyInterviewViewController.h"
#import "FeedbackViewController.h"
#import "LogicalThinkingViewController.h"
#import "MainlyRevisionViewController.h"


@interface SelectViewController ()

@property(strong,nonatomic)NSMutableArray *dataArray;
@property(strong,nonatomic)UICollectionView *collect;
@property(nonatomic,assign)NSInteger Tag;
@end

@implementation SelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.dataArray = [NSMutableArray arrayWithObjects:@"习题收藏",@"考试测试",@"认证考试",@"阶段复习",@"练习历史",@"人事65问",@"错题记录",@"企业面试",@"意见反馈",@"逻辑思维", nil];
    [self initSubviews];
    
}

-(void)initSubviews
{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 0.5)];
    [self.view addSubview:view];
    
    
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
 
    UIViewController *viewController;
    
    switch (indexPath.row) {
        case 0:
            viewController = [[TopicCollectViewController alloc]init];
            break;
            
        case 1:
            viewController = [[SecondSelectViewController alloc]init];
            break;
            
        case 2:
            
        case 3:
            viewController = [[MainlyRevisionViewController alloc]init];
            break;

            
        case 4:
            viewController = [[PracticeHistoryViewController alloc]init];
            break;
            
        case 5:
            _Tag = 2;
            [self Method];
            
            break;
            
        case 6:
            viewController = [[ErrorRecordViewController alloc]init];
            
            break;
            
        case 7:
            viewController = [[CompanyInterviewViewController alloc]init];
            
            break;
            
        case 8:
            viewController = [[FeedbackViewController alloc]init];
            
            break;

        case 9:
            
             _Tag = 1;
            [self Method];
            
            break;

            
        default:
            break;
    }
    
    
    [self.navigationController pushViewController:viewController animated:YES];
}
#pragma mark 人事和逻辑
-(void)Method{
    LogicalThinkingViewController *l = [[LogicalThinkingViewController alloc]init];
    l.num = _Tag;
    [self.navigationController pushViewController:l animated:YES];
}

@end
