//
//  YYServiceOtherDiZhuCell.m
//  JiaoDiZhuDemo
//
//  Created by chongzi on 15/11/7.
//  Copyright © 2015年 LYY. All rights reserved.
//

#import "YYServiceOtherDiZhuCell.h"
#import "YYRouteServiceModel.h"
#import "YYDizhuModel.h"
#import "QYLabel.h"

@interface YYServiceOtherDiZhuCell()
@property (nonatomic, strong)UIView *contentBgView;
@property (nonatomic, strong)UIImageView *poiImageView;
@property (nonatomic, strong)QYLabel *titleLabel;
@property (nonatomic, strong)QYLabel *addressLabel;
@property (nonatomic, strong)QYLabel *priceLabel;
@property (nonatomic, strong)DYRateView *rateView;

//数据源
@property (nonatomic, strong) YYDizhuModel *dizhuModel;
@end

@implementation YYServiceOtherDiZhuCell
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
    
    _contentBgView = [[UIView alloc] initWithFrame:CGRectZero];
    _contentBgView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_contentBgView];
    

    _poiImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _poiImageView.backgroundColor = _contentBgView.backgroundColor;
    [_contentBgView addSubview:_poiImageView];
    
    _titleLabel = [[QYLabel alloc] initWithFrame:CGRectZero];
    _titleLabel.numberOfLines = 0;
    _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _titleLabel.verticalAlignment = PLVerticalAlignmentMiddle;
    _titleLabel.copyingEnabled = NO;
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.font = [UIFont systemFontOfSize:16];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.backgroundColor = _contentBgView.backgroundColor;
    [_contentBgView addSubview:_titleLabel];
    
    _addressLabel = [[QYLabel alloc] initWithFrame:CGRectZero];
    _addressLabel.numberOfLines = 0;
    _addressLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _addressLabel.verticalAlignment = PLVerticalAlignmentMiddle;
    _addressLabel.copyingEnabled = NO;
    _addressLabel.backgroundColor = [UIColor clearColor];
    _addressLabel.font = [UIFont systemFontOfSize:12];
    _addressLabel.textColor = [UIColor blackColor];
    _addressLabel.backgroundColor = _contentBgView.backgroundColor;
    [_contentBgView addSubview:_addressLabel];

    _priceLabel = [[QYLabel alloc] initWithFrame:CGRectZero];
    _priceLabel.numberOfLines = 0;
    _priceLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _priceLabel.verticalAlignment = PLVerticalAlignmentMiddle;
    _priceLabel.copyingEnabled = NO;
    _priceLabel.backgroundColor = [UIColor clearColor];
    _priceLabel.font = [UIFont systemFontOfSize:16];
    _priceLabel.textColor = RGB(220, 40, 12);
    _priceLabel.backgroundColor = _contentBgView.backgroundColor;
    [_contentBgView addSubview:_priceLabel];

    _rateView = [[DYRateView alloc] initWithFrame:CGRectMake(0, 0, 60, 10)
                                         fullStar:[UIImage imageNamed:@"bigStar"]
                                        emptyStar:[UIImage imageNamed:@"bigStar2"]];
    _rateView.backgroundColor = [UIColor clearColor];
    _rateView.alignment = RateViewAlignmentLeft;
    _rateView.rate = 0.5;
    [_contentBgView addSubview:_rateView];

    
}
- (void)configDataWithModel:(id)model
{
    _dizhuModel = model;
    _titleLabel.text = _dizhuModel.title;
    _poiImageView.image = [UIImage imageNamed:_dizhuModel.pic_url];
    _addressLabel.text = _dizhuModel.address;
    _priceLabel.text = [NSString stringWithFormat:@"￥%.0f",_dizhuModel.price];
    [_rateView setRate:_dizhuModel.rate/5.0];
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
    frame.origin.y = 0;
    frame.size.width = UIWidth - 2*10;
    frame.size.height = CELL_HEIGHT;
    _contentBgView.frame = frame;
    _contentBgView.clipsToBounds = YES;
    _contentBgView.layer.cornerRadius = 5;
    
    
    frame.origin.x = 0;
    frame.origin.y = 0;
    frame.size.width = _contentBgView.width;
    frame.size.height = frame.size.width/1.6;
    _poiImageView.frame = frame;
    
    frame.origin.x = 10;
    frame.origin.y = _poiImageView.y + _poiImageView.height + 10;
    frame.size.width = 230;
    frame.size.height = 20;
    _titleLabel.frame = frame;

    frame.origin.y += frame.size.height + 5;
    _addressLabel.frame = frame;
    
    frame.origin.y += frame.size.height + 5;
    _priceLabel.frame = frame;
    
    frame.origin.x = _contentBgView.width - 10 - 60;
    frame.size.width = 60;
    frame.size.height = 10;
    _rateView.frame = frame;

}

+(CGFloat)cellHeightWithData:(id)model
{
    CGFloat height = 0;
    
    height += (UIWidth -2*10)/1.6;
    height += (10 + 20);
    height += (5 + 20);
    height += (5 + 20);
    height += 10;
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
