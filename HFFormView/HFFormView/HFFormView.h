//
//  HFFormView.h
//  HFFormView
//
//  Created by Hayware on 15/10/20.
//  Copyright © 2015年 HayFi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HFFormView : UIView

/**
 *  初始化表格
 *
 *  @param frame      可定制视图位置及长宽，宽度为每一行的高度
 *  @param dataSource 数据源
 *  @param styleModel 表格样式，根据HFFormModel中的属性进行调整
 *
 *  @return return value description
 */
- (instancetype)initWithFrame:(CGRect)frame dataSource:(NSArray *)dataSource detailStyleModel:(HFFormModel *)styleModel;

/**
 *  回调参数
 *
 *  @param block block description 将修改后的数据回调
 */
- (void)hfUpdateDataSourceWithBlock:(void (^)(NSArray * dataSource))block;

@end
