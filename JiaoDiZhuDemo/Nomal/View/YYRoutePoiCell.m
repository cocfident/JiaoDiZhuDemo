//
//  YYRoutePoiCell.m
//  JiaoDiZhuDemo
//
//  Created by chongzi on 15/11/7.
//  Copyright © 2015年 LYY. All rights reserved.
//

#import "YYRoutePoiCell.h"
#import "YYCircleView.h"
#import "YYRouteModle.h"

#define kMargin 16/2
#define kLogoWidth 40/2
#define kLogoHeight 40/2

#define kImageWidth (60/2)
#define kImageHeight (60/2)

#define offset_top   26/2
#define offset_left   15
#define offset_right  15
#define offset_bottom  26/2

@interface YYRoutePoiCell()
@property (nonatomic, strong)YYCircleView *circleView;
@property(nonatomic,  strong)QYLabel *titleLabel;
@property (nonatomic, strong)QYLabel *descLabel;

//数据源
@property (nonatomic, strong) YYRouteModle *poiModel;
@end

@implementation YYRoutePoiCell
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
    
    self.topLineImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.topLineImageView.backgroundColor = RGB(224, 224, 224);
    [self.contentView addSubview:self.topLineImageView];
    
    _circleView = [[YYCircleView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    _circleView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_circleView];

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
    _descLabel.textColor = RGB(138, 138, 138);
    _descLabel.backgroundColor = self.contentView.backgroundColor;
    [self.contentView addSubview:_descLabel];
    
    self.bottomLineImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.bottomLineImageView.backgroundColor = RGB(224, 224, 224);
    [self.contentView addSubview:self.bottomLineImageView];

}
- (void)configDataWithModel:(id)model
{
    _poiModel = model;
    _titleLabel.text = _poiModel.poi_title;
    _descLabel.text = _poiModel.poi_desc;
}

#pragma mark --- layoutSubviews 调整各子视图frame
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.contentView.frame = self.bounds;//iOS6以上版本要加这句话，你妹啊
    //调整各子视图frame
    NSLog(@"comment cell11宽度是%f",self.width);
    CGRect frame = CGRectZero;
    frame.origin.x = 50;
    frame.origin.y = 0;
    frame.size.width = 2;
    frame.size.height = 40;
    self.topLineImageView.frame = frame;
    
    frame.size.width = 30;
    frame.size.height = 30;
    frame.origin.y = self.topLineImageView.y + self.topLineImageView.height;
    frame.origin.x = self.topLineImageView.x - (frame.size.height/2 + self.topLineImageView.width/2);
    _circleView.frame = frame;
    
    frame.origin.x = _circleView.x + _circleView.width + 5;
    frame.size.width = 200;
    _titleLabel.frame = frame;
    
    CGFloat stringMaxWidth = CELL_WIDTH - _titleLabel.x - 15;
    CGSize contentSize = [StringSizeUtil getContentSize:_poiModel.poi_desc font:_descLabel.font width:stringMaxWidth];
    
    frame.origin.x = _titleLabel.x;
    frame.origin.y = _titleLabel.y + _titleLabel.height + 10;
    frame.size.width = stringMaxWidth;
    frame.size.height = ceilf(contentSize.height);
    _descLabel.frame = frame;
    
    frame.origin.x = self.topLineImageView.x;
    frame.origin.y = _circleView.y + _circleView.height;
    frame.size.width = 2;
    frame.size.height = contentSize.height + 20;
    self.bottomLineImageView.frame = frame;
}

+(CGFloat)cellHeightWithData:(id)model
{
    YYRouteModle *dataModel = model;
    CGFloat height = 0;
    
    height += 40;
    height += 30;
    
    CGFloat stringMaxWidth = UIWidth - 71 - 15;
    CGSize contentSize = [StringSizeUtil getContentSize:dataModel.poi_desc font:[UIFont systemFontOfSize:12] width:stringMaxWidth];

    height += (ceilf(contentSize.height) + 20);
    
    return height;
}

- (void)setbottomLineimageHiden:(BOOL)hide
{
    self.bottomLineImageView.hidden = hide;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
