//
//  ViewController.m
//  JiaoDiZhuDemo
//
//  Created by chongzi on 15/11/7.
//  Copyright © 2015年 LYY. All rights reserved.
//

#import "YYRootViewController.h"
#import "YYServiceEvaluateCell.h"
#import "YYCircleView.h"
#import "PLTableViewCell.h"
#import "YYRoutePoiCell.h"
#import "YYRoutePoiImageCell.h"
#import "YYServiceContentCell.h"
#import "YYRouteServiceModel.h"
#import "YYServiceOtherDiZhuCell.h"

#import "YYRouteModle.h"
#import "YYDizhuModel.h"


#define kDefaultHeaderViewHeight 50
static  NSString * const routeCellIdentifier = @"RouteCellIdentifier";
static  NSString * const routeImageCellIdentifier = @"routeImageCellIdentifier";
static  NSString * const routeServiceContentIdentifier = @"routeServiceContentIdentifier";
static  NSString * const routeServiceEvaluateIdentifier = @"routeServiceEvaluateIdentifier";
static  NSString * const routeOtherDiZhuIdentifier = @"routeOtherDiZhuIdentifier";
@interface YYRootViewController ()
@property (nonatomic, strong)YYRouteServiceModel *serviceModel;
@property (nonatomic, strong)NSMutableArray *dataArray;
@end

@implementation YYRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    self.isTopViewBlur = NO;
    
    [self.view addSubview:[self tableview]];
    [self setupHeadView];
    [self setupFooterView];
    [self configData];
    [self.tableview reloadData];
    
}
#pragma mark - 设置tableview headerview
- (void)setupHeadView
{
    //headerview
    UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 280)];
    tableHeaderView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *routeBgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, tableHeaderView.width, 160)];
    routeBgImageView.image = [UIImage imageNamed:@"topPic"];
    [tableHeaderView addSubview:routeBgImageView];
    
    UIImageView *userIconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    userIconImageView.center = CGPointMake(tableHeaderView.width/2, routeBgImageView.height);
    userIconImageView.image = [UIImage imageNamed:@"user_icon"];
    userIconImageView.clipsToBounds = YES;
    userIconImageView.layer.cornerRadius = userIconImageView.height/2;
    userIconImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    userIconImageView.layer.borderWidth = 2;
    [tableHeaderView addSubview:userIconImageView];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, userIconImageView.y + userIconImageView.height + 10, tableHeaderView.width, 10)];
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.text = @"湾区伙伴";
    nameLabel.font = [UIFont systemFontOfSize:10];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [tableHeaderView addSubview:nameLabel];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, nameLabel.y + nameLabel.height + 10, tableHeaderView.width - 10, 10)];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.text = @"硅谷最神秘的Demo Day,  只邀请对创业最有见解的你!";
    titleLabel.font = [UIFont systemFontOfSize:12];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [tableHeaderView addSubview:titleLabel];
    
    UILabel *addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, titleLabel.y + titleLabel.height + 10, tableHeaderView.width - 10, 10)];
    addressLabel.textColor = [UIColor grayColor];
    addressLabel.text = @"帕洛阿尔托,美国 | Palo Alto, USA  (0)";
    addressLabel.font = [UIFont systemFontOfSize:10];
    addressLabel.textAlignment = NSTextAlignmentLeft;
    [tableHeaderView addSubview:addressLabel];

    [self.tableview setTableHeaderView:tableHeaderView];
}
- (void)setupFooterView
{
    //footerView set
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 170)];
    footerView.backgroundColor = RGB(240, 240, 240);
    
    UIView *footerContentBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 50, self.view.width, 120)];
    footerContentBgView.backgroundColor = RGB(56, 56, 56);
    [footerView addSubview:footerContentBgView];
    
    NSArray *titleArray = @[@"关于地主",@"联系我们",@"用户协议",@"免责声明"];
    CGFloat kWidht = 70;
    CGFloat kMargin = (UIWidth - kWidht*4)/5;
    for (int i = 0; i < 4; i++) {
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kMargin*(i+1) + kWidht*i, 20, kWidht, 30)];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.text = titleArray[i];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [footerContentBgView addSubview:titleLabel];
    }
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, footerContentBgView.height/2 - 0.5, footerContentBgView.width, 0.5)];
    lineView.backgroundColor = RGB(92, 92, 92);
    [footerContentBgView addSubview:lineView];

    UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, footerContentBgView.height/2 + 15, footerContentBgView.width, 30)];
    rightLabel.textColor = RGB(92, 92, 92);
    rightLabel.text = @"@2105 北京小月科技有限公司";
    rightLabel.font = [UIFont systemFontOfSize:14];
    rightLabel.textAlignment = NSTextAlignmentCenter;
    [footerContentBgView addSubview:rightLabel];
    
    [self.tableview setTableFooterView:footerView];

}
- (void)configData
{
    //本地测试数据
    NSBundle  *baudel= [NSBundle mainBundle];
    NSString  *path1=[baudel pathForResource:@"budgetlist" ofType:@"json"];
    NSData *data=[NSData dataWithContentsOfFile:path1];
    //==JsonObject
    id JsonObject=[NSJSONSerialization JSONObjectWithData:data
                                                  options:NSJSONReadingAllowFragments
                                                    error:nil];
    NSLog(@"json是    %@",JsonObject);
    
    NSDictionary *dic = JsonObject[@"data"][@"service_detail"];
    
    self.serviceModel = [[YYRouteServiceModel alloc] initWithDictionary:dic error:nil];
    

}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
      return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0://行程
            return [self.serviceModel.route count];
            break;
        case 1://服务包含
            if (IsEmpty(self.serviceModel.service_content))
            {
                return 0;
            }else{
                return 1;
            }
            break;
        case 2://评价
            if (IsEmpty(self.serviceModel.service_evaluate))
            {
                return 0;
            }else{
                return 1;
            }
            break;
        case 3://同城地主
            return [self.serviceModel.other_service_people count];
            break;
            default:
            break;
    }
    
    
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PLTableViewCell *cell;
    JSONModel *model;
    
    if (indexPath.section == 0) {
        
        model = self.serviceModel.route[indexPath.row];
        YYRouteModle *routeModel = (YYRouteModle *)model;
        if (routeModel.poi_type == 1) {
            cell = [tableView dequeueReusableCellWithIdentifier:routeCellIdentifier forIndexPath:indexPath];
            if (self.serviceModel.route.count -1 == indexPath.row) {
                [cell setbottomLineimageHiden:YES];
            }else{
                [cell setbottomLineimageHiden:NO];
            }
            
        }else{
            cell = [tableView dequeueReusableCellWithIdentifier:routeImageCellIdentifier forIndexPath:indexPath];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }else if (indexPath.section == 1){
        model = self.serviceModel;
        cell = [tableView dequeueReusableCellWithIdentifier:routeServiceContentIdentifier forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }else if (indexPath.section == 2)
    {
        model = self.serviceModel;
        cell = [tableView dequeueReusableCellWithIdentifier:routeServiceEvaluateIdentifier forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }else if (indexPath.section == 3)
    {
        model = self.serviceModel.other_service_people[indexPath.row];
        cell = [tableView dequeueReusableCellWithIdentifier:routeOtherDiZhuIdentifier forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    else{
        return nil;
    }
    [cell configDataWithModel:model];
    return cell;
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {//行程
        NSArray *routeArray = self.serviceModel.route;
        YYRouteModle *routeModel = routeArray[indexPath.row];
        if (routeModel.poi_type == 1) {
             return [YYRoutePoiCell cellHeightWithData:routeModel];
        }else{
            return [YYRoutePoiImageCell cellHeightWithData:routeModel];
        }
       
    }else if (indexPath.section == 1){//服务内容
         return [YYServiceContentCell cellHeightWithData:self.serviceModel];
    }else if (indexPath.section == 2){
        
        return [YYServiceEvaluateCell cellHeightWithData:self.serviceModel];
    }else if (indexPath.section == 3){
        NSArray *routeArray = self.serviceModel.other_service_people;
        YYDizhuModel *dizhuModel = routeArray[indexPath.row];

        return [YYServiceOtherDiZhuCell cellHeightWithData:dizhuModel];
    }

    else{
        return 0;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0://行程
            return 0.00001;
            break;
        case 1://服务内容
            if (IsEmpty(_serviceModel.service_content))
            {
                return 0.00001;
            }
            return kDefaultHeaderViewHeight;
            break;
        case 2://服务评价
        {
            if (IsEmpty(_serviceModel.service_evaluate))
            {
                return 0.00001;
            }else{
                return kDefaultHeaderViewHeight;
            }
            
        }
            break;
        case 3://其他地主
            if ([_serviceModel.other_service_people count] == 0)
            {
                return 0.00001;
            }else{
                return kDefaultHeaderViewHeight;
            }
            
            break;
        default:
            break;
    }
    return kDefaultHeaderViewHeight;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [[UIView alloc] init];
    headView.backgroundColor = RGB(240, 240, 240);;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 150, 20)];
    titleLabel.backgroundColor = headView.backgroundColor;
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.font = [UIFont systemFontOfSize:16];
    [headView addSubview:titleLabel];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(10, kDefaultHeaderViewHeight, UIWidth - 2*10, 1)];
    lineView.backgroundColor = RGB(205, 205, 205);
    [headView addSubview:lineView];
    BOOL isLineHideen = NO;

    switch (section) {
        case 0://
        {
            isLineHideen = YES;
            return nil;
        }
            
            break;
        case 1:
        {
            isLineHideen = NO;
            titleLabel.text = @"服务包含";
            if (IsEmpty(_serviceModel.service_content)) {
                return nil;
            }
            break;
        }
        case 2:
        {
            isLineHideen = NO;
            titleLabel.text = @"评价";
            if (IsEmpty(_serviceModel.service_evaluate)) {
                return nil;
            }
            break;
        }
        case 3://点评
        {
            titleLabel.text = @"同城市其他地主";
            isLineHideen = YES;
            if (_serviceModel.other_service_people.count == 0) {
                return nil;
            }
        }
            break;
        default:
            break;
    }
    lineView.hidden = isLineHideen;
    
    return headView;
    
}
#pragma mark - setter & getter
- (UITableView *)tableview
{
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, topView_height, UIWidth, UIHeight - topView_height) style:UITableViewStyleGrouped];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableview registerClass:[YYRoutePoiCell class] forCellReuseIdentifier:routeCellIdentifier];
        [_tableview registerClass:[YYRoutePoiImageCell class] forCellReuseIdentifier:routeImageCellIdentifier];
        [_tableview registerClass:[YYServiceContentCell class] forCellReuseIdentifier:routeServiceContentIdentifier];
        [_tableview registerClass:[YYServiceEvaluateCell class] forCellReuseIdentifier:routeServiceEvaluateIdentifier];
        [_tableview registerClass:[YYServiceOtherDiZhuCell class] forCellReuseIdentifier:routeOtherDiZhuIdentifier];

    }
    return _tableview;
}
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _dataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
