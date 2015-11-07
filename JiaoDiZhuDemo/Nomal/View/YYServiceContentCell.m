//
//  YYServiceContentCell.m
//  JiaoDiZhuDemo
//
//  Created by chongzi on 15/11/7.
//  Copyright © 2015年 LYY. All rights reserved.
//

#import "YYServiceContentCell.h"
#import "YYRouteServiceModel.h"
#import "DYRateView.h"
@interface YYServiceContentCell()
@property (nonatomic, strong)DYRateView *rateView;
@property (nonatomic, strong)QYLabel *dateLabel;
@property (nonatomic, strong)QYLabel *titleLabel;
@property (nonatomic, strong)QYLabel *descLabel;

//数据源
@property (nonatomic, strong) YYRouteServiceModel *serviceModel;
@end

@implementation YYServiceContentCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        NSLog(@"comment cell宽度是%f",self.width);
        [self configSubviews];
    }
    return self;
    
}
- (void)configSubviews
{
    self.contentView.backgroundColor = RGB(240, 240, 240);
    
//    _rateView = [[DYRateView alloc] initWithFrame:CGRectMake(0, 0, 60, 10)
//                                         fullStar:[UIImage imageNamed:@"bigStar"]
//                                        emptyStar:[UIImage imageNamed:@"bigStar2"]];
//    _rateView.backgroundColor = [UIColor clearColor];
//    _rateView.alignment = RateViewAlignmentLeft;
//    _rateView.rate = 0.5;
//    _rateView.hidden = YES;
//    [self addSubview:_rateView];
//    
//    _dateLabel = [[QYLabel alloc] initWithFrame:CGRectZero];
//    _dateLabel.numberOfLines = 0;
//    _dateLabel.lineBreakMode = NSLineBreakByWordWrapping;
//    _dateLabel.verticalAlignment = PLVerticalAlignmentMiddle;
//    _dateLabel.copyingEnabled = NO;
//    _dateLabel.backgroundColor = [UIColor clearColor];
//    _dateLabel.font = [UIFont systemFontOfSize:14];
//    _dateLabel.textColor = [UIColor blackColor];
//    _dateLabel.backgroundColor = self.contentView.backgroundColor;
//    [self.contentView addSubview:_dateLabel];

    _titleLabel = [[QYLabel alloc] initWithFrame:CGRectZero];
    _titleLabel.numberOfLines = 0;
    _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _titleLabel.verticalAlignment = PLVerticalAlignmentMiddle;
    _titleLabel.copyingEnabled = NO;
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.font = [UIFont systemFontOfSize:14];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.backgroundColor = self.contentView.backgroundColor;
    [self.contentView addSubview:_titleLabel];

    _descLabel = [[QYLabel alloc] initWithFrame:CGRectZero];
    _descLabel.numberOfLines = 0;
    _descLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _descLabel.verticalAlignment = PLVerticalAlignmentMiddle;
    _descLabel.copyingEnabled = NO;
    _descLabel.backgroundColor = [UIColor clearColor];
    _descLabel.font = [UIFont systemFontOfSize:12];
    _descLabel.textColor = [UIColor blackColor];
    _descLabel.backgroundColor = self.contentView.backgroundColor;
    [self.contentView addSubview:_descLabel];
}
- (void)configDataWithModel:(id)model
{
    _serviceModel = model;
    _titleLabel.text = _serviceModel.service_content_title;
    _descLabel.text = _serviceModel.service_content;

}

#pragma mark --- layoutSubviews 调整各子视图frame
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.contentView.frame = self.bounds;//iOS6以上版本要加这句话，你妹啊
    //调整各子视图frame
    NSLog(@"comment cell11宽度是%f",self.width);
    CGRect frame = CGRectZero;
    
    frame.origin.x = 10;
    frame.origin.y = 30;
    frame.size.width = 200;
    frame.size.height = 20;
    _titleLabel.frame = frame;
    
    
    CGFloat stringMaxWidth = UIWidth - 2*10;
    CGSize contentSize = [StringSizeUtil getContentSize:_serviceModel.service_content font:_descLabel.font width:stringMaxWidth];
    frame.origin.x = 10;
    frame.origin.y = _titleLabel.y + _titleLabel.height + 5;
    frame.size.width = stringMaxWidth;
    frame.size.height = ceilf(contentSize.height);
    _descLabel.frame = frame;
    
}

+(CGFloat)cellHeightWithData:(id)model
{
    YYRouteServiceModel *dataModel = model;
    CGFloat height = 0;
    
    height += 30;
    height += 20 + 5;
    
    CGFloat stringMaxWidth = UIWidth - 2*10;
    CGSize contentSize = [StringSizeUtil getContentSize:dataModel.service_content font:[UIFont systemFontOfSize:12] width:stringMaxWidth];
    
    height += (ceilf(contentSize.height) + 20);
    
    return height;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
