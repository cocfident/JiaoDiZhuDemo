//
//  YYRouteModle.h
//  JiaoDiZhuDemo
//
//  Created by chongzi on 15/11/7.
//  Copyright © 2015年 LYY. All rights reserved.
//

#import "JSONModel.h"

@interface YYRouteModle : JSONModel
@property (nonatomic, copy) NSString *poi_title;
@property (nonatomic, assign) NSInteger poi_type;
@property (nonatomic, copy) NSString *poi_image;
@property (nonatomic, copy) NSString *poi_desc;
@end
