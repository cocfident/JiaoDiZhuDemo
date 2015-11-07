//
//  ViewController.m
//  JiaoDiZhuDemo
//
//  Created by chongzi on 15/11/7.
//  Copyright © 2015年 LYY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYBaseViewController : UIViewController
{
    UIImageView *navImageView;  //导航图片
    UIView      *navImageViewTopView;//导航栏图片上的背景view，可遮盖毛玻璃效果
    UIButton    *leftBtn;       //左侧按钮
    UIButton    *rightBtn;      //右侧按钮
    UIButton    *middleBtn;     //中间按钮
    UILabel     *lblTitle;      //标题

}

/**
 *  导航栏是否需要毛玻璃效果
 */
@property (nonatomic, assign) BOOL isTopViewBlur;
/**
 *  左侧菜单按钮或者是返回
 */
- (void)menuAction;

/**
 *  中间按钮事件
 */
- (void)middleAction;

/**
 *  右按钮点击事件
 */
- (void)rightAction;

@property (nonatomic,strong) UILabel *shadowView;


@end
