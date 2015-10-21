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

@property(nonatomic, strong) NSArray * changeDataSource;

@property(nonatomic, strong) HFFormView * formView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initDataSource];
    [self initUserInterface];
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
        data.title = [NSString stringWithFormat:@"title%ld", i + 1];
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
    HFFormModel * model = [[HFFormModel alloc] init];
    model.headName = @"表头";
    model.form1Name = @"form1";
    model.form2Name = @"form2";
    model.form3Name = @"form3";
    model.headColor = HF_GreenColor;
    model.headTintColor = [UIColor whiteColor];
    model.formColor = [UIColor whiteColor];
    model.formTintColor = HF_GreenColor;
    _formView = [[HFFormView alloc] initWithFrame:CGRectMake(10, 120, CGRectGetWidth(self.view.bounds) - 20, 48) dataSource:_dataSource detailStyleModel:model];
    [self.view addSubview:_formView];
    __weak typeof(self) weakSelf = self;
    [_formView hfUpdateDataSourceWithBlock:^(id data) {
        weakSelf.changeDataSource = [[NSArray alloc] initWithArray:data];
        NSLog(@"changeDataSource:%@",weakSelf.changeDataSource);
    }];
    
    
}



@end
