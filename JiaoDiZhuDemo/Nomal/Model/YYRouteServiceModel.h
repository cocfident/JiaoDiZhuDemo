//
//  YYRouteServiceModel.h
//  JiaoDiZhuDemo
//
//  Created by chongzi on 15/11/7.
//  Copyright © 2015年 LYY. All rights reserved.
//

#import "JSONModel.h"
@protocol YYRouteModle
@end
@protocol YYDizhuModel
@end

@interface YYRouteServiceModel : JSONModel
@property (nonatomic, copy) NSString *service_content;
@property (nonatomic, copy) NSString *service_content_title;
@property (nonatomic, copy) NSString *service_people;
@property (nonatomic, copy) NSString *service_evaluate;
@property (nonatomic, copy) NSString *service_evaluate_date;
@property (nonatomic, assign) NSInteger service_rate;
@property (nonatomic, strong) NSArray<YYRouteModle> *route;
@property (nonatomic, strong) NSArray<YYDizhuModel> *other_service_people;
@end
