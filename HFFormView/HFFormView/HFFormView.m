//
//  HFFormView.m
//  HFFormView
//
//  Created by Hayware on 15/10/20.
//  Copyright © 2015年 HayFi. All rights reserved.
//

#import "HFFormView.h"
#import "LabelWithTextField.h"

#define TEXTFIELD_TAG 1000

@interface HFFormView () <UITextFieldDelegate>
{
    NSInteger _changeTag;
}

@property(nonatomic, strong) LabelWithTextField * textfield;

@property(nonatomic, strong) NSMutableArray * dataSource;

@property(nonatomic, copy) void (^dataBlock)(id objc);

@property(nonatomic, strong) UIScrollView * scrollView;

@end

@implementation HFFormView

- (instancetype)initWithFrame:(CGRect)frame dataSource:(NSArray *)dataSource detailStyleModel:(HFFormModel *)styleModel
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = CGRectGetWidth(self.bounds);
        CGFloat height = 48;
        
        _dataSource = [[NSMutableArray alloc] init];
        if (_dataSource) {
            [_dataSource removeAllObjects];
        }
        [_dataSource addObjectsFromArray:dataSource];
        
        NSLog(@"数据加载Source：%@", _dataSource);
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        view.backgroundColor = styleModel.headColor;
        [self addSubview:view];
        
        CGFloat labelWidth = width / 2.4;
        
        UILabel * nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, height)];
        //        nameLabel.backgroundColor = [UIColor aolanGreenColor];
        nameLabel.layer.borderWidth = lineWidth;
        nameLabel.layer.borderColor = styleModel.headTintColor.CGColor;
        nameLabel.text = styleModel.headName;
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.font = [UIFont systemFontOfSize:16];
        nameLabel.textColor = styleModel.headTintColor;
        [view addSubview:nameLabel];
        
        CGFloat otherWidth = (width - labelWidth) / 3;
        NSArray * names = @[styleModel.form1Name,styleModel.form2Name,styleModel.form3Name];
        
        for (int i = 0; i < names.count; i ++) {
            UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(labelWidth + i * otherWidth, 0, otherWidth, height)];
            label.text = names[i];
            label.layer.borderWidth = lineWidth;
            label.layer.borderColor = [UIColor grayColor].CGColor;
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont systemFontOfSize:16];
            label.textColor = styleModel.headTintColor;
            [view addSubview:label];
        }
        
        NSInteger i;
        
        if (_dataSource.count > 4) {
            i = 4;
        } else {
            i = _dataSource.count;
        }
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(view.frame), width, height * i)];
        _scrollView.contentSize = CGSizeMake(width, height * _dataSource.count);
        _scrollView.backgroundColor = styleModel.formColor;
        _scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_scrollView];
        
        CGRect frame = self.frame;
        frame.size.height = _scrollView.frame.size.height + nameLabel.frame.size.height;
        self.frame = frame;
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor grayColor].CGColor;
        
        for (NSInteger i = 0; i < _dataSource.count; i ++) {
            DetailFormModel * model = [DetailFormModel objectWithKeyValues:_dataSource[i]];
            _textfield = [[LabelWithTextField alloc] initWithFrame:CGRectMake(0, i * height, CGRectGetWidth(_scrollView.bounds), height)];
            _textfield.nameLabel.text = model.title;
            _textfield.morTextField.text = model.firstSource;
            _textfield.afterTextField.text = model.secondSource;
            _textfield.evenTextfield.text = model.thirdSource;
            _textfield.morTextField.tag = (i + 1) * TEXTFIELD_TAG + 1;
            _textfield.afterTextField.tag = (i + 1) * TEXTFIELD_TAG + 2;
            _textfield.evenTextfield.tag = (i + 1) * TEXTFIELD_TAG + 3;
            [_textfield setlabelAndTextFieldTextColor:styleModel.formTintColor];
            _textfield.morTextField.delegate = self;
            _textfield.afterTextField.delegate = self;
            _textfield.evenTextfield.delegate = self;
            [_scrollView addSubview:_textfield];
        }

    }
    return self;
}

- (void)hfUpdateDataSourceWithBlock:(void (^)(id))block
{
    _dataBlock = block;

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    //    NSLog(@"%ld", textField.tag);
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSInteger x = (_changeTag - 1) / TEXTFIELD_TAG - 1;
    NSInteger y = (_changeTag - 1) % TEXTFIELD_TAG;
    if (x < 0 || y < 0) {
        return;
    }
    DetailFormModel * model = [DetailFormModel objectWithKeyValues:(NSDictionary *)_dataSource[x]];
    
    switch (y) {
        case 0:{
            model.firstSource = textField.text;
        }
            break;
        case 1:{
            model.secondSource = textField.text;
        }
            break;
        case 2:{
            model.thirdSource = textField.text;
        }
            break;
        default:
            break;
    }
    [_dataSource replaceObjectAtIndex:x withObject:model.keyValues];
    _dataBlock(_dataSource);
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    _changeTag = textField.tag;
    
    int max_chars = 4;
    NSMutableString * newText = [NSMutableString stringWithString:textField.text];
    [newText replaceCharactersInRange:range withString:string];
    return ([newText length] <= max_chars);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
