//
//  DetailedAnswerViewController.h
//  ShangTest
//
//  Created by len on 16/9/6.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailedAnswerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UILabel *Problemlbl;
@property (weak, nonatomic) IBOutlet UILabel *Answerlbl;
@property(nonatomic, strong,readwrite) NSString *ProblemStr;
@property(nonatomic, strong,readwrite) NSString *AnswerStr;
@end
