//
//  PLTableViewCell.h
//  PlanHelper
//
//  Created by 王鹏 on 15/4/23.
//  Copyright (c) 2015年 qyer. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CELL_WIDTH self.frame.size.width
#define CELL_HEIGHT self.frame.size.height
#define LINE_HEIGHT 0.5f
static CGFloat const kTextLineSpace = 2.0;
@interface PLTableViewCell : UITableViewCell
/**
 *  点击高亮效果的视图
 */
@property (nonatomic, strong) UIView *highlightBackgroundView;
/**
 *  时间轴连接线
 */
@property (nonatomic, strong) UIImageView *topLineImageView;
/**
 *  时间轴连接线
 */
@property (nonatomic, strong) UIImageView *bottomLineImageView;

/**
 *  根据Model，配置显示数据
 *
 *  @param model
 */
- (void)configDataWithModel:(id)model;
/**
 *  根据Model，计算cell高度
 *
 *  @param model model
 *
 *  @return cell高度
 */
+ (CGFloat)cellHeightWithData:(id)model;
/**
 *  隐藏上部时间轴连接点
 *
 *  @param hide yes or no
 */
- (void)setTopLineimageHiden:(BOOL)hide;
/**
 *  隐藏底部时间轴连接点
 *
 *  @param hide yes or no
 */
- (void)setbottomLineimageHiden:(BOOL)hide;
@end
