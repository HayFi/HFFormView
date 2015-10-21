//
//  UITextField+Extra.m
//  HFFormView
//
//  Created by Hayware on 15/10/20.
//  Copyright © 2015年 HayFi. All rights reserved.
//

#import "UITextField+Extra.h"

@implementation UITextField (Extra)

- (void)setTextFieldStyle
{
    self.textAlignment = NSTextAlignmentCenter;
    self.borderStyle = UITextBorderStyleNone;
    self.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    //关闭键盘自动纠错
    self.autocorrectionType = UITextAutocorrectionTypeNo;
    //自动大小写
    self.autocapitalizationType = UITextAutocapitalizationTypeNone;
    ///光标颜色
    self.tintColor = HF_GreenColor;
}

@end
