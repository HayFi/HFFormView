//
//  ViewController.m
//  HFFormView
//
//  Created by Hayware on 15/10/20.
//  Copyright © 2015年 HayFi. All rights reserved.
//

#import "ViewController.h"
#import "HFFormView.h"

@interface ViewController ()

@property(nonatomic, strong) NSArray * dataSource;


@property(nonatomic, strong) HFFormView * formView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initDataSource];
    [self initUserInterface];
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.view.bounds) - 50, CGRectGetWidth(self.view.bounds), 30)];
    label.text = @"iOS/Swift开发交流2群：384187260";
    label.textColor = [UIColor grayColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initDataSource
{
    NSMutableArray * dataSource = [NSMutableArray array];
    for (NSInteger i = 0; i < 8; i ++) {
        DetailFormModel * data = [[DetailFormModel alloc] init];
        data.cellTitle = [NSString stringWithFormat:@"title%ld", i + 1];
        data.firstSource = [NSString stringWithFormat:@"1%ld", i];
        data.secondSource = [NSString stringWithFormat:@"2%ld", i];
        data.thirdSource = [NSString stringWithFormat:@"3%ld", i];
        [dataSource addObject:data.keyValues];
    }
    _dataSource = [[NSArray alloc] initWithArray:dataSource];
//    NSLog(@"%@")
}

- (void)initUserInterface
{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 36, CGRectGetWidth(self.view.bounds), 30)];
    label.text = @"HFFormView";
    label.textColor = HF_GreenColor;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:22];
    [self.view addSubview:label];
    
    HFFormModel * model = [[HFFormModel alloc] init];
    model.headName = @"表头";
    model.form1Name = @"form1";
    model.form2Name = @"form2";
    model.form3Name = @"form3";
    model.headColor = HF_GreenColor;
    model.headTintColor = [UIColor whiteColor];
    model.formColor = [UIColor whiteColor];
    model.formTintColor = HF_GreenColor;
    _formView = [[HFFormView alloc] initWithFrame:CGRectMake(10, 160, CGRectGetWidth(self.view.bounds) - 20, 48) dataSource:_dataSource detailStyleModel:model];
    [self.view addSubview:_formView];
    

    [_formView hfUpdateDataSourceWithBlock:^(NSArray *dataSource) {
        /**
         *  参数回调操作
         */
        NSLog(@"changeDataSource:%@", dataSource);
    }];
    
    
}



@end
