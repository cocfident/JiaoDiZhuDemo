//
//  QYLabel.h
//  QYLabel
//
//  Created by chongzi on 15/11/7.
//  Copyright © 2015年 LYY. All rights reserved.
//
// QYLabel继承自UILabel,label应有的属性和功能都可使用。在原生Label的基础上加入了以下四个功能：
//1:可长按弹出复制menu,进行文本复制。默认此功能关闭，设置copyingEnabled开关即可
//2:可调整垂直方向上对齐方式：顶部对齐，中心对齐，底部对齐。默认顶部对齐
//3:可快捷设置行间距，只需要设置lineSpace即可。默认行间距为0
//4:可设置文字上覆盖横线，常用于价格标签。可设置横线位置（顶部，底部，中间）和颜色。默认不带横线
//此自定义Label可以满足常见需求，如需扩展建议在此基础上进行扩展。轻量，好用且可控。

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
/**
 *  横线位置枚举
 */
typedef NS_ENUM(NSUInteger, QYLabelLineType) {
    QYLabelLineTypeNone,//default
    QYLabelLineTypeTop,
    QYLabelLineTypeMiddle,
    QYLabelLineTypeBottom
};
/**
 *  文本垂直对齐方式枚举
 */
typedef enum{
    PLVerticalAlignmentTop = 0,//default
    PLVerticalAlignmentMiddle,
    PLVerticalAlignmentBottom
}PLVerticalAlignment;

@class QYLabel;

@protocol QYLabelDelegate <NSObject>

@optional
- (NSString *)stringToCopyForCopyableLabel:(QYLabel *)copyableLabel;
- (CGRect)copyMenuTargetRectInCopyableLabelCoordinates:(QYLabel *)copyableLabel;

@end

@interface QYLabel : UILabel
//长按 复制功能相关属性
@property (nonatomic, assign) BOOL copyingEnabled; // Defaults to NO

@property (nonatomic, weak) id<QYLabelDelegate> copyableLabelDelegate;

@property (nonatomic, assign) UIMenuControllerArrowDirection copyMenuArrowDirection; // Defaults to UIMenuControllerArrowDefault

// You may want to add longPressGestureRecognizer to a container view
@property (nonatomic, strong, readonly) UILongPressGestureRecognizer *longPressGestureRecognizer;
//文本排列相关属性
@property (nonatomic, assign) PLVerticalAlignment verticalAlignment;// Defaults to PLVerticalAlignmentTop
@property (nonatomic, assign) CGFloat lineSpace;
//下划线
@property (nonatomic, assign) QYLabelLineType lineType;
@property (nonatomic, strong) UIColor *lineColor;

- (void)setText:(NSString *)text;
@end
