//
//  SchoolDetailTableViewCell.m
//  ShangTest
//
//  Created by len on 16/8/16.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "SchoolDetailTableViewCell.h"

@implementation SchoolDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)callPhone:(id)sender {
//    NSURL *url = [NSURL URLWithString:@"tel://100100100"];
//    [[UIApplication sharedApplication] openURL:url];
    UIWebView *webView = [[UIWebView alloc]init];
    NSURL *url = [NSURL URLWithString:@"tel://100100100"];
    [webView loadRequest:[NSURLRequest requestWithURL:url ]];
}


@end
