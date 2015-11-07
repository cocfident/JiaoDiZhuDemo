//
//  StringSizeUtil.m
//  PlanHelper
//
//  Created by zhangyihui on 14-7-22.
//  Copyright (c) 2014年 qyer. All rights reserved.
//

#import "StringSizeUtil.h"
#import <CoreText/CoreText.h>
//uilable 行间距高度
static CGFloat const lineSapceHeight = 5.0f;
@implementation StringSizeUtil
/**
 *  根据内容，字体，宽度，计算size
 
 */
+(CGSize)getContentSize:(NSString *)content font:(UIFont *)pFont width:(CGFloat)pWidth 
{
    CGSize contentSize;
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    // iPhone OS SDK 7.0 及其以后版本的处理
    if (IS_IOS7) {
        contentSize = [content boundingRectWithSize:CGSizeMake(pWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:pFont,NSFontAttributeName, nil] context:nil].size;
    }
    
#else
    // iPhone OS SDK 7.0 之前版本的处理
    else{
        
        contentSize = [content sizeWithFont:pFont constrainedToSize:CGSizeMake(pWidth, MAXFLOAT) lineBreakMode:NSLineBreakByCharWrapping];
    }
    
#endif
    
    return CGSizeMake(ceil(contentSize.width), ceil(contentSize.height));
}
/**
 *  根据内容，字体，行间距，宽度，计算size
 */

+(CGSize)getContentSize:(NSString *)content font:(UIFont *)pFont lineSpace:(CGFloat)lineSpace width:(CGFloat)pWidth
{
    CGSize contentSize;
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    // iPhone OS SDK 7.0 及其以后版本的处理
    if (IS_IOS7) {
        NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:lineSpace];
        contentSize = [content boundingRectWithSize:CGSizeMake(pWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:pFont,NSFontAttributeName,paragraphStyle,NSParagraphStyleAttributeName,nil] context:nil].size;
    }
    
#else
    // iPhone OS SDK 7.0 之前版本的处理
    else{
        
        contentSize = [content sizeWithFont:pFont constrainedToSize:CGSizeMake(pWidth, MAXFLOAT) lineBreakMode:NSLineBreakByCharWrapping];
    }
    
#endif
    
    return CGSizeMake(ceil(contentSize.width), ceil(contentSize.height));
}

/**
 *  根据内容，字体，高度，计算size
 
 */
+(CGSize)getContentSize:(NSString *)content font:(UIFont *)pFont height:(CGFloat)pHeight
{
    CGSize contentSize;
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    // iPhone OS SDK 7.0 及其以后版本的处理
    if (IS_IOS7) {
        contentSize = [content boundingRectWithSize:CGSizeMake(MAXFLOAT, pHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:pFont,NSFontAttributeName, nil] context:nil].size;
        
    }
    
#else
    // iPhone OS SDK 7.0 之前版本的处理
    else{
        
        contentSize = [content sizeWithFont:pFont constrainedToSize:CGSizeMake(MAXFLOAT, pHeight) lineBreakMode:NSLineBreakByCharWrapping];
    }
#endif
    return CGSizeMake(ceil(contentSize.width), ceil(contentSize.height));
}
+ (CGFloat)getLineHeightWithFont:(UIFont *)font
{
    CGFloat lineHeight;
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    // iPhone OS SDK 7.0 及其以后版本的处理
    if (IS_IOS7) {
        
        lineHeight= [@"样本" sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil]].height;
    }
    
#else
    // iPhone OS SDK 7.0 之前版本的处理
    else{
        lineHeight = [@"样本" sizeWithFont:font].height;
    }
#endif
    return ceilf(lineHeight);
}
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
                       lineSpece:(CGFloat)lineSpace
{
    CGFloat lineHeight;
    lineHeight= [self getLineHeightWithFont:font];
    return ceilf(numberOfLines * lineHeight + lineSpace*(numberOfLines-1))+1;//+1是个不得已的值啊，因为计算出来的高度总是有一点的偏差，这个问题后续解决
}


@end
