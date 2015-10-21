//
//  HFFormView.h
//  HFFormView
//
//  Created by Hayware on 15/10/20.
//  Copyright © 2015年 HayFi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HFFormView : UIView

- (instancetype)initWithFrame:(CGRect)frame dataSource:(NSArray *)dataSource detailStyleModel:(HFFormModel *)styleModel;

- (void)hfUpdateDataSourceWithBlock:(void (^)(id data))block;

@end
