//
//  YYDizhuModel.h
//  JiaoDiZhuDemo
//
//  Created by chongzi on 15/11/7.
//  Copyright © 2015年 LYY. All rights reserved.
//

#import "JSONModel.h"

@interface YYDizhuModel : JSONModel
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *pic_url;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, assign) CGFloat price;
@property (nonatomic, assign) NSInteger rate;
@end
