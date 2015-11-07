//
//  YYCircleView.m
//  JiaoDiZhuDemo
//
//  Created by chongzi on 15/11/7.
//  Copyright © 2015年 LYY. All rights reserved.
//

#import "YYCircleView.h"

@implementation YYCircleView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    UIColor*aColor = [UIColor whiteColor];
//    CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
//    CGContextSetStrokeColorWithColor(context, aColor.CGColor);
//    CGContextSetLineWidth(context, 3.0);//线的宽度
//    CGContextAddArc(context, self.width/2, self.height/2, self.width/2, 0, 2*M_PI, 0); //添加一个圆
//    CGContextDrawPath(context, kCGPathFillStroke); //绘制路径加填充
    
    UIBezierPath *_shapePath=[UIBezierPath bezierPathWithArcCenter:CGPointMake(self.width/2, self.width/2) radius:self.width/2 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    /**创建带形状的图层*/
    CAShapeLayer *_shapeLayer=[CAShapeLayer layer];
    _shapeLayer.frame=self.bounds;
    /**注意:图层之间与贝塞尔曲线之间通过path进行关联*/
    _shapeLayer.path=_shapePath.CGPath;
    _shapeLayer.fillColor=[UIColor whiteColor].CGColor;
    [self.layer addSublayer:_shapeLayer];
}


@end
