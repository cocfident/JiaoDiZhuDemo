//
//  PLTableViewCell.m
//  PlanHelper
//
//  Created by 王鹏 on 15/4/23.
//  Copyright (c) 2015年 qyer. All rights reserved.
//

#import "PLTableViewCell.h"

@implementation PLTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
   self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.exclusiveTouch = YES;
        
        self.backgroundColor = [UIColor clearColor];
        
        _highlightBackgroundView = [[UIView alloc] initWithFrame:self.bounds];
        _highlightBackgroundView.backgroundColor = RGBA(0, 0, 0, 10);
        _highlightBackgroundView.alpha = 0;
        [self.contentView addSubview:_highlightBackgroundView];
    }
    return self;
}

- (void)configDataWithModel:(id)model
{
    //subclass overwrite
}
/**
 *  根据Model，计算cell高度
 *
 *  @param model model
 *
 *  @return cell高度
 */
+(CGFloat)cellHeightWithData:(id)model
{
    return 40;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    _highlightBackgroundView.frame = self.bounds;
}

/**
 *  隐藏上部时间轴连接线
 *
 *  @param hide yes or no
 */
- (void)setTopDotimageHiden:(BOOL)hide
{
}
/**
 *  隐藏底部时间轴连接线
 *
 *  @param hide yes or no
 */
- (void)setbottomDotimageHiden:(BOOL)hide
{
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
