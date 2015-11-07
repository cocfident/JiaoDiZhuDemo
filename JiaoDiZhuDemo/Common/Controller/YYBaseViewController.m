//
//  ViewController.m
//  JiaoDiZhuDemo
//
//  Created by chongzi on 15/11/7.
//  Copyright © 2015年 LYY. All rights reserved.
//

#import "YYBaseViewController.h"

@interface YYBaseViewController ()

@end

@implementation YYBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _isTopViewBlur = YES;
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}
- (void)viewDidLoad
{
    // Do any additional setup after loading the view.
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 0, UIWidth, UIHeight);
    self.view.backgroundColor = RGB(250, 250, 250);
    [self resetNavigationBar];
}

-(void)resetNavigationBar
{
    if(IS_IOS7)
    {
        navImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, UIWidth, topView_height)];
        navImageViewTopView = [[UIView alloc] initWithFrame:navImageView.bounds];
        navImageViewTopView.backgroundColor = [UIColor whiteColor];
        navImageViewTopView.hidden = _isTopViewBlur;
    }
    else
    {
        navImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, UIWidth, topView_height)];
        navImageView.backgroundColor = [UIColor whiteColor];
    }
    navImageView.userInteractionEnabled = YES;
    [navImageView addSubview:navImageViewTopView];
    [self.view addSubview:navImageView];
    
    
    leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(4, topView_origin_y + 2, 40, 40)];
    leftBtn.backgroundColor = [UIColor clearColor];
    [leftBtn setImage:[UIImage imageNamed:@"icon_menu"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(menuAction) forControlEvents:UIControlEventTouchUpInside];
    [navImageView addSubview:leftBtn];
    
    middleBtn = [[UIButton alloc]initWithFrame:CGRectMake(UIWidth - 4 -88, topView_origin_y + 2, 40, 40)];
    middleBtn.backgroundColor = [UIColor clearColor];
    [middleBtn setImage:[UIImage imageNamed:@"icon_map"] forState:UIControlStateNormal];
    [middleBtn addTarget:self action:@selector(middleAction) forControlEvents:UIControlEventTouchUpInside];
    [navImageView addSubview:middleBtn];
    
    rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(UIWidth - 44, topView_origin_y + 2, 40, 40)];
    rightBtn.backgroundColor = [UIColor clearColor];
    [rightBtn setImage:[UIImage imageNamed:@"icon_message"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    [navImageView addSubview:rightBtn];
    
    lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(UIWidth/2-100, topView_origin_y, 200, 44)];
    lblTitle.text = IsEmpty(super.title)?@"叫地主":super.title;
    lblTitle.numberOfLines = 0;
    lblTitle.font = [UIFont systemFontOfSize:16];
    lblTitle.textColor = RGB(65, 192, 116);
    lblTitle.backgroundColor = [UIColor clearColor];
    lblTitle.textAlignment = NSTextAlignmentCenter;
    [navImageView addSubview:lblTitle];
    
    
    _shadowView = [[UILabel alloc] initWithFrame:CGRectMake(0, topView_height-0.5, UIWidth, 0.5)];
    _shadowView.backgroundColor = [UIColor colorWithRed:225/255. green:225/255. blue:225/255. alpha:1];
    [navImageView addSubview:_shadowView];
}


/**
 *  左侧菜单按钮事件
 */
- (void)menuAction
{

}


/**
 *  中间按钮事件
 */
- (void)middleAction
{
    
    
}


/**
 *  右按钮点击事件
 */
- (void)rightAction
{
    
    
}

#pragma mark - setters
- (void)setIsTopViewBlur:(BOOL)isTopViewBlur{
    navImageViewTopView.hidden = isTopViewBlur;
}

-(void)setTitle:(NSString *)title{
    
    if (lblTitle) {
        lblTitle.text = title;
    }else{
        super.title = title;
    }
}

-(NSString *)title{
    if (lblTitle) {
        return lblTitle.text;
    }
    return super.title;
}

#pragma mark -
#pragma mark --- 内存警告
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
