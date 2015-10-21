//
//  LabelWithTextField.m
//  HFFormView
//
//  Created by Hayware on 15/10/20.
//  Copyright © 2015年 HayFi. All rights reserved.
//

#import "LabelWithTextField.h"



@implementation LabelWithTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = CGRectGetWidth(self.bounds);
        CGFloat height = 48;
        CGFloat labelWidth = width / 2.4;
        CGFloat otherWidth = (width - labelWidth) / 3;
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, height)];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.textColor = [UIColor darkGrayColor];
        _nameLabel.numberOfLines = 2;
        _nameLabel.layer.borderWidth = lineWidth;
        _nameLabel.layer.borderColor = [UIColor grayColor].CGColor;
        _nameLabel.font = FONT_SIZE_15;
        _nameLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:_nameLabel];
        
        
        _morTextField = [[TextFieldWithLine alloc] initWithFrame:CGRectMake(labelWidth, 0, otherWidth, height)];
        [_morTextField setTextFieldStyle];
        _morTextField.layer.borderWidth = lineWidth;
        _morTextField.layer.borderColor = [UIColor grayColor].CGColor;
        _morTextField.font = FONT_SIZE_15;
        [self addSubview:_morTextField];
        
        _afterTextField = [[TextFieldWithLine alloc] initWithFrame:CGRectMake(labelWidth + otherWidth, 0, otherWidth, height)];
        [_afterTextField setTextFieldStyle];
        _afterTextField.layer.borderWidth = lineWidth;
        _afterTextField.layer.borderColor = [UIColor grayColor].CGColor;
        _afterTextField.font = FONT_SIZE_15;
        [self addSubview:_afterTextField];
        
        _evenTextfield = [[TextFieldWithLine alloc] initWithFrame:CGRectMake(labelWidth + otherWidth * 2, 0, otherWidth, height)];
        [_evenTextfield setTextFieldStyle];
        _evenTextfield.layer.borderWidth = lineWidth;
        _evenTextfield.layer.borderColor = [UIColor grayColor].CGColor;
        _evenTextfield.font = FONT_SIZE_15;
        [self addSubview:_evenTextfield];
    }
    return self;
}

- (void)setlabelAndTextFieldTextColor:(UIColor *)textColor
{
    _nameLabel.textColor = textColor;
    _morTextField.textColor = textColor;
    _afterTextField.textColor = textColor;
    _evenTextfield.textColor = textColor;
}


@end
