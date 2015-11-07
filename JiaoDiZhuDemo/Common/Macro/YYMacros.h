//
//  PrefixHeader.pch
//  JiaoDiZhuDemo
//
//  Created by chongzi on 15/11/7.
//  Copyright © 2015年 LYY. All rights reserved.
//

#pragma mark - 字符串处理
#define LocalText(text) NSLocalizedString(text, nil)
#define IsEmpty(str) (![str respondsToSelector:@selector(isEqualToString:)] || [str isEqualToString:@""] || [str isEqualToString:@"(null)"])
#define NO_INPUT_TEXT(text) (([text isEqualToString:@""]||text.length == 0) ?@"未填写":text)
#define PLEASE_INPUT_TEXT(text) (([text isEqualToString:@""]||text.length == 0) ?@"请填写":text)

#pragma mark - UI尺寸处理
#define UIHeight [[UIScreen mainScreen] bounds].size.height
#define UIWidth [[UIScreen mainScreen] bounds].size.width
#define UIWidthRate (UIWidth/320.0)
#define MAIN_WINDOW [[[UIApplication sharedApplication] windows] objectAtIndex:0]
#define topView_origin_y    (IS_IOS7 ? (20) : 0)
#define topView_height      (IS_IOS7 ? (44+20) : 44)

#pragma mark - 设备硬件及型号判断
#define IS_IPHONE4 (([[UIScreen mainScreen] bounds].size.height - 480 == 0.) ? YES:NO)
#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height - 568 >= 0.) ? YES:NO)
#define IS_IPHONE6 (([[UIScreen mainScreen] bounds].size.height - 667 >= 0.) ? YES:NO)
#define IS_IPHONE6p (([[UIScreen mainScreen] bounds].size.height - 736 >= 0.) ? YES:NO)
#define IS_IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7. ? YES :NO)
#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8. ? YES :NO)

#pragma mark - 色值处理
#define RGB(x,y,z) [UIColor colorWithRed:x/255. green:y/255. blue:z/255. alpha:1.]
#define RGBA(x,y,z,a) [UIColor colorWithRed:x/255. green:y/255. blue:z/255. alpha:a/100.]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

