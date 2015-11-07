//
//  ViewController.h
//  JiaoDiZhuDemo
//
//  Created by chongzi on 15/11/7.
//  Copyright © 2015年 LYY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYBaseViewController.h"
@interface YYRootViewController : YYBaseViewController<UITableViewDelegate,
UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableview;

@end

