//
//  TextFieldWithLine.m
//  HFFormView
//
//  Created by Hayware on 15/10/20.
//  Copyright © 2015年 HayFi. All rights reserved.
//

#import "TextFieldWithLine.h"

@implementation TextFieldWithLine

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect
{
    CGFloat height = 1;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, HF_GreenColor.CGColor);
    CGContextFillRect(context, CGRectMake(height * 18, CGRectGetHeight(self.frame) - height * 10, CGRectGetWidth(self.frame) - height * 36, height * 1.2));
    CGContextSetLineWidth(context, 2);
    
}

@end
