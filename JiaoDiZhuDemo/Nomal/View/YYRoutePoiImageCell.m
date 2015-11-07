//
//  YYRoutePoiImageCell.m
//  JiaoDiZhuDemo
//
//  Created by chongzi on 15/11/7.
//  Copyright © 2015年 LYY. All rights reserved.
//

#import "YYRoutePoiImageCell.h"
#import "YYRouteModle.h"

@interface YYRoutePoiImageCell()
@property (nonatomic, strong)UIView *contentBgView;
@property (nonatomic, strong)UIImageView *poiImageView;
@property (nonatomic, strong)QYLabel *descLabel;

//数据源
@property (nonatomic, strong) YYRouteModle *poiModel;
@end

@implementation YYRoutePoiImageCell
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
    
    _descLabel = [[QYLabel alloc] initWithFrame:CGRectZero];
    _descLabel.numberOfLines = 0;
    _descLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _descLabel.verticalAlignment = PLVerticalAlignmentMiddle;
    _descLabel.copyingEnabled = NO;
    _descLabel.backgroundColor = [UIColor clearColor];
    _descLabel.font = [UIFont systemFontOfSize:12];
    _descLabel.textColor = [UIColor blackColor];
    _descLabel.backgroundColor = _contentBgView.backgroundColor;
    [_contentBgView addSubview:_descLabel];
}
- (void)configDataWithModel:(id)model
{
    _poiModel = model;
    _poiImageView.image = [UIImage imageNamed:_poiModel.poi_image] ;
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
    frame.origin.x = 10;
    frame.origin.y = 0;
    frame.size.width = UIWidth - 2*10;
    frame.size.height = CELL_HEIGHT;
    _contentBgView.frame = frame;
    
    frame.origin.x = 0;
    frame.origin.y = 0;
    frame.size.width = _contentBgView.width;
    frame.size.height = frame.size.width;
    _poiImageView.frame = frame;
    
    
    CGFloat stringMaxWidth = _contentBgView.width - 2*20;
    CGSize contentSize = [StringSizeUtil getContentSize:_poiModel.poi_desc font:_descLabel.font width:stringMaxWidth];
    frame.origin.x = 20;
    frame.origin.y = _poiImageView.y + _poiImageView.height + 15;
    frame.size.width = stringMaxWidth;
    frame.size.height = ceilf(contentSize.height);
    _descLabel.frame = frame;
    
}

+(CGFloat)cellHeightWithData:(id)model
{
    YYRouteModle *dataModel = model;
    CGFloat height = 0;
    
    height += UIWidth - 2*10;
    height += 15;
    
    CGFloat stringMaxWidth = UIWidth - 2*10 - 2*20;
    CGSize contentSize = [StringSizeUtil getContentSize:dataModel.poi_desc font:[UIFont systemFontOfSize:12] width:stringMaxWidth];
    
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
