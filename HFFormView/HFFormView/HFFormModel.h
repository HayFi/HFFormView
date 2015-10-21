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
 *  列表数据源
 */
@property(nonatomic, copy) NSString * headName;

@property(nonatomic, copy) NSString * form1Name;

@property(nonatomic, copy) NSString * form2Name;

@property(nonatomic, copy) NSString * form3Name;


/**
 *  表头背景色
 */
@property(nonatomic, copy) UIColor * headColor;

/**
 *  字体颜色
 */
@property(nonatomic, copy) UIColor * headTintColor;

/**
 *  列表背景色
 */
@property(nonatomic, copy) UIColor * formColor;

/**
 *  列表颜色
 */
@property(nonatomic, copy) UIColor * formTintColor;

@end



@interface DetailFormModel : NSObject

@property(nonatomic, copy) NSString * title;

@property(nonatomic, copy) NSString * firstSource;

@property(nonatomic, copy) NSString * secondSource;

@property(nonatomic, copy) NSString * thirdSource;

@end