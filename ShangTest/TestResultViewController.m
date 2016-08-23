//
//  TestResultViewController.m
//  ShangTest
//
//  Created by len on 16/8/23.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "TestResultViewController.h"
#import "SHPieChartView.h"

@interface TestResultViewController ()
@property (weak, nonatomic) IBOutlet SHPieChartView *pieCharView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonHeight;
@property (weak, nonatomic) IBOutlet UIView *buttonView;

@end

@implementation TestResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_pieCharView addAngleValue:.6 andColor:[UIColor redColor]];
    [_pieCharView addAngleValue:.4 andColor:[UIColor yellowColor]];
    
    self.dataArray = [NSMutableArray arrayWithArray:@[@"fsda",@"fsda",@"fsda",@"fsda",@"fsda",@"fsda",@"fsda",@"fsda",@"fsda",@"fsda"]];
}

-(void)setButtonViewLayout
{
    float singleWidth = (SCREEN_WIDTH-20+3)/10;
    
    int i;
    for ( i = 0; i < ceilf(_dataArray.count/10.0); i++) {
        for (int j = 0; j < 10; j++) {
            UIButton *b = [[UIButton alloc]init];
            [_buttonView addSubview:b];
            [b setTitle:[NSString stringWithFormat:@"%d",i*10+j] forState:UIControlStateNormal];
            
            b.frame = CGRectMake(j*(singleWidth+3), i*(singleWidth+3), singleWidth, singleWidth);
            
        }
    }
    _buttonHeight.constant = i * (singleWidth +3);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
