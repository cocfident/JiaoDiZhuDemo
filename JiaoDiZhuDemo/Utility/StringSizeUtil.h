//
//  StringSizeUtil.h
//  PlanHelper
//
//  Created by zhangyihui on 14-7-22.
//  Copyright (c) 2014年 qyer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringSizeUtil : NSObject
/**
 *  根据内容，字体，宽度，计算size ,行高为系统默认行间距之下的高度
 */
+(CGSize)getContentSize:(NSString *)content font:(UIFont *)pFont width:(CGFloat)pWidth;
/**
 *  根据内容，字体，行间距，宽度，计算size
 */

+(CGSize)getContentSize:(NSString *)content font:(UIFont *)pFont lineSpace:(CGFloat)lineSpace width:(CGFloat)pWidth;
/**
 *  根据内容，字体，高度，计算size 行高为系统默认行间距之下的高度
 */
+(CGSize)getContentSize:(NSString *)content font:(UIFont *)pFont height:(CGFloat)pHeight;

/**
 *  单行高度
 *
 *  @param font 字体
 *
 *  @return 高度
 */
+ (CGFloat)getLineHeightWithFont:(UIFont *)font;
/**
 *  n行高度
 *
 *  @param font          font 字体
 *  @param numberOfLines 行数
 *  @param lineSpace     行间距
 *
 *  @return n行高度
 */
+ (CGFloat)getLineHeightWithFont:(UIFont *)font
          limitedToNumberOfLines:(NSInteger)numberOfLines
                       lineSpece:(CGFloat)lineSpace;
@end
