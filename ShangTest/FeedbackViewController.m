//
//  FeedbackViewController.m
//  ShangTest
//
//  Created by len on 16/9/8.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "FeedbackViewController.h"
#define URL	@"http://139.224.73.86:8080/sxt_app/addFeedback.do"

@interface FeedbackViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *lblOne;
@property (weak, nonatomic) IBOutlet UILabel *lblTwo;
@property (weak, nonatomic) IBOutlet UILabel *lblThree;
- (IBAction)backBtn:(id)sender;
- (IBAction)clickBtn:(id)sender;
@end

@implementation FeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"第100名反馈有奖";
    
    _textView.delegate = self;
    _textView.layer.cornerRadius = 10;
    _textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _textView.layer.borderWidth = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


-(void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length == 0) {
        _lblOne.hidden = NO;
        _lblTwo.hidden = NO;
        _lblThree.hidden = NO;

        
    }else{
        _lblOne.hidden = YES;
        _lblTwo.hidden = YES;
        _lblThree.hidden = YES;

    }
       
}

- (IBAction)backBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clickBtn:(id)sender {

    NSMutableDictionary *params2=[NSMutableDictionary dictionary];
    params2[@"content"] = self.textView.text ;
    AFHTTPRequestOperationManager *mgr2=[AFHTTPRequestOperationManager manager];
    [mgr2 POST:URL parameters:params2  success:^(AFHTTPRequestOperation * operation, id responsObject)
     {
         //[self hiddenWaitHUD];
         //NSLog(@"反馈成功");
         [self showHUDWithMessage:@"反馈成功" HiddenDelay:0.5];
         
     } failure:^(AFHTTPRequestOperation * operation, NSError * error)
     {
         [self showHUDWithMessage:@"网络错误" HiddenDelay:0.5];
     }];
    

}
@end
