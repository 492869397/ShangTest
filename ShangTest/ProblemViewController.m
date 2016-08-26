//
//  ProblemViewController.m
//  ShangTest
//
//  Created by mac on 16/8/26.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "ProblemViewController.h"
#import "ProblemTableViewCell.h"

@interface ProblemViewController ()

@property(nonatomic,strong)NSMutableArray *array;

@property(nonatomic,assign)NSInteger selectSection;

@property(nonatomic,strong)UITableView *table;

@end

@implementation ProblemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.selectSection = -1;
    self.array = [NSMutableArray arrayWithObjects:@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"", nil];
    
    [self initSubviewLayout];
}

-(void)initSubviewLayout
{
    self.table = [[UITableView alloc]initWithFrame:CGRectMake(0, 69, SCREEN_WIDTH, SCREEN_HEIGHT -69)];
    [self.view addSubview:_table];
    _table.separatorStyle = UITableViewCellSeparatorStyleNone;
    _table.dataSource = self;
    _table.delegate = self;
    _table.rowHeight = UITableViewAutomaticDimension;
    _table.estimatedRowHeight = 60;
    _table.backgroundColor = [UIColor lightGrayColor];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _array.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_selectSection == section) {
        return 1;
    }
    return 0;
}



-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProblemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ProblemTableViewCell" owner:nil options:nil]firstObject];
        cell.content.layer.cornerRadius = 5;
        cell.content.layer.masksToBounds = YES;
    }
    
    cell.content.text = @"sdfasfasgasdjglakdfjglkdfgjsgjasigjakshgkahsdkjgahskjghajkshdgajkhsdjkgahsjkghajksfhakjdfhajkhfjkaghfkjhakjfhdkjaskja";
    
    return cell;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]init];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, SCREEN_WIDTH-10,1000 )];
    label.backgroundColor = [UIColor whiteColor];
    label.layer.cornerRadius = 5;
    label.layer.masksToBounds = YES;
    [view addSubview:label];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.text = @"asdfkla;skdfalskda;lsaklsdjalksdjgalskdjgalksjgakls";
    [label sizeToFit];
    
    label.tag = section;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapSection:)];
    label.userInteractionEnabled = YES;
    [label addGestureRecognizer:tap];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, SCREEN_WIDTH-10,1000 )];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.text = @"asdfkla;skdfalskda;lsaklsdjalksdjgalskdjgalksjgakls";
    [label sizeToFit ];
    return label.frame.size.height+10;
}

-(void)tapSection:(UITapGestureRecognizer*)tap
{
    if (_selectSection == tap.view.tag) {
        _selectSection = -1;
    }else
    {
        _selectSection = tap.view.tag;

    }
    [self.table reloadData];
}

@end
