//
//  HFFormModel.h
//  HFFormView
//
//  Created by Hayware on 15/10/20.
//  Copyright © 2015年 HayFi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HFFormModel : NSObject

/**
 *  列表表头名
 */
@property(nonatomic, copy) NSString * headName;

/**
 *  第一列标题
 */
@property(nonatomic, copy) NSString * form1Name;

/**
 *  第二列标题
 */
@property(nonatomic, copy) NSString * form2Name;

/**
 *  第三列标题
 */
@property(nonatomic, copy) NSString * form3Name;

/**
 *  表头背景色
 */
@property(nonatomic, copy) UIColor * headColor;

/**
 *  表头字体色
 */
@property(nonatomic, copy) UIColor * headTintColor;

/**
 *  列表背景色
 */
@property(nonatomic, copy) UIColor * formColor;

/**
 *  列表字体色
 */
@property(nonatomic, copy) UIColor * formTintColor;

@end

@interface DetailFormModel : NSObject

/**
 *  行标题
 */
@property(nonatomic, copy) NSString * cellTitle;

/**
 *  以下为可修改数据
 */
@property(nonatomic, copy) NSString * firstSource;

@property(nonatomic, copy) NSString * secondSource;

@property(nonatomic, copy) NSString * thirdSource;

@end