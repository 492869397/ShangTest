//
//  SchoolDetailViewController.m
//  ShangTest
//
//  Created by len on 16/8/16.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "SchoolDetailViewController.h"
#import "SchoolDetailTableViewCell.h"

@interface SchoolDetailViewController ()


@end

@implementation SchoolDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"saf";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifier = @"cell";
    SchoolDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"SchoolDetailTableViewCell" owner:nil options:nil]firstObject];
    }
    
    
    return  cell;
    
}

@end
