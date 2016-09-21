//
//  CALayer+LayerColor.m
//  money
//
//  Created by len on 16/9/18.
//  Copyright © 2016年 sxt. All rights reserved.
//

#import "CALayer+LayerColor.h"

@implementation CALayer (LayerColor)

- (void)setBorderColorFromUIColor:(UIColor *)color
{
    
    self.borderColor = color.CGColor;
    
    
}

@end
