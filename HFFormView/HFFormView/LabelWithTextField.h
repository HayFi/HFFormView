//
//  LabelWithTextField.h
//  HFFormView
//
//  Created by Hayware on 15/10/20.
//  Copyright © 2015年 HayFi. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TextFieldWithLine.h"

@interface LabelWithTextField : UIView

@property(nonatomic, strong) UILabel * nameLabel;
@property(nonatomic, strong) TextFieldWithLine * morTextField;
@property(nonatomic, strong) TextFieldWithLine * afterTextField;
@property(nonatomic, strong) TextFieldWithLine * evenTextfield;

- (void)setlabelAndTextFieldTextColor:(UIColor *)textColor;

@end
