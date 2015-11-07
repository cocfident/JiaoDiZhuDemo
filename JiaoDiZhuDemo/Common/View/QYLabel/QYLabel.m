//
//  QYLabel.h
//  QYLabel
//
//  Created by chongzi on 15/11/7.
//  Copyright © 2015年 LYY. All rights reserved.
//

#import "QYLabel.h"

@interface QYLabel ()

@end

@implementation QYLabel

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [self setup];
}
/**
 *  默认设置
 */
- (void)setup
{
    _longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGestureRecognized:)];
    _longPressGestureRecognizer.enabled = NO;
    [self addGestureRecognizer:_longPressGestureRecognizer];
    
    _copyMenuArrowDirection = UIMenuControllerArrowDefault;
    _copyingEnabled = NO;
    _verticalAlignment = PLVerticalAlignmentTop;    
    self.userInteractionEnabled = YES;
}

-(CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    CGRect textRect=[super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch(self.verticalAlignment)
    {
        case PLVerticalAlignmentTop:
            textRect.origin.y=bounds.origin.y;
            break;
        case PLVerticalAlignmentMiddle:
            textRect.origin.y=bounds.origin.y+(bounds.size.height-textRect.size.height)/2.0;
            break;
        case PLVerticalAlignmentBottom:
            textRect.origin.y=bounds.origin.y+bounds.size.height-textRect.size.height;
            break;
        default:
            textRect.origin.y=bounds.origin.y+(bounds.size.height-textRect.size.height)/2.0;
            break;
    }
    return textRect;
}
-(void)drawTextInRect:(CGRect)rect
{
    CGRect actualRect=[self textRectForBounds:rect limitedToNumberOfLines:self.numberOfLines];//重新计算位置
    [super drawTextInRect:actualRect];
    
    if (self.lineType == QYLabelLineTypeNone) {
        return;
    }
    
    CGSize textSize = actualRect.size;
    CGFloat strikeWidth = textSize.width;
    CGRect lineRect = CGRectZero;
    CGFloat origin_x = 0;
    CGFloat origin_y = 0;
    
    if ([self textAlignment] == NSTextAlignmentRight) {
        
        origin_x = rect.size.width - strikeWidth;
        
    } else if ([self textAlignment] == NSTextAlignmentCenter) {
        
        origin_x = (rect.size.width - strikeWidth)/2 ;
        
    } else {
        
        origin_x = 0;
    }
    
    
    if (self.lineType == QYLabelLineTypeTop) {
        
        origin_y =  actualRect.origin.y + 2;
    }
    
    if (self.lineType == QYLabelLineTypeMiddle) {
        
        origin_y =  actualRect.origin.y + actualRect.size.height/2;
    }
    
    if (self.lineType == QYLabelLineTypeBottom) {//下画线
        
        origin_y = actualRect.origin.y + actualRect.size.height - 2;
    }
    
    lineRect = CGRectMake(origin_x , origin_y, strikeWidth, 1);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat R, G, B, A;
    UIColor *uiColor = self.lineColor;
    CGColorRef color = [uiColor CGColor];
    NSInteger numComponents = CGColorGetNumberOfComponents(color);
    
    if( numComponents == 4)
    {
        const CGFloat *components = CGColorGetComponents(color);
        R = components[0];
        G = components[1];
        B = components[2];
        A = components[3];
        
        CGContextSetRGBFillColor(context, R, G, B, A);
    }
    
    CGContextFillRect(context, lineRect);

}
#pragma mark - event response
- (void)longPressGestureRecognized:(UILongPressGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer == self.longPressGestureRecognizer)
    {
        if (gestureRecognizer.state == UIGestureRecognizerStateBegan)
        {
            NSAssert([self becomeFirstResponder], @"Sorry, UIMenuController will not work with %@ since it cannot become first responder", self);
            
            UIMenuController *copyMenu = [UIMenuController sharedMenuController];
            if ([self.copyableLabelDelegate respondsToSelector:@selector(copyMenuTargetRectInCopyableLabelCoordinates:)])
            {
                [copyMenu setTargetRect:[self.copyableLabelDelegate copyMenuTargetRectInCopyableLabelCoordinates:self] inView:self];
            }
            else
            {
                [copyMenu setTargetRect:self.bounds inView:self];
            }
            copyMenu.arrowDirection = self.copyMenuArrowDirection;
            [copyMenu setMenuVisible:YES animated:YES];
        }
    }
}

- (BOOL)canBecomeFirstResponder
{
    return self.copyingEnabled;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    BOOL retValue = NO;
    
    if (action == @selector(copy:))
    {
        if (self.copyingEnabled)
        {
            retValue = YES;
        }
    }
    else
    {
        // Pass the canPerformAction:withSender: message to the superclass
        // and possibly up the responder chain.
        retValue = [super canPerformAction:action withSender:sender];
    }
    
    return retValue;
}

- (void)copy:(id)sender
{
    if (self.copyingEnabled)
    {
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        NSString *stringToCopy;
        if ([self.copyableLabelDelegate respondsToSelector:@selector(stringToCopyForCopyableLabel:)])
        {
            stringToCopy = [self.copyableLabelDelegate stringToCopyForCopyableLabel:self];
        }
        else
        {
            stringToCopy = self.text;
        }
        
        [pasteboard setString:stringToCopy];
    }
}

#pragma mark - setters
/**
 *  设置垂直方向上对齐方式
 */
-(void)setVerticalAlignment:(PLVerticalAlignment)verticalAlignment
{
    _verticalAlignment=verticalAlignment;
    [self setNeedsDisplay];//重绘一下
}
/**
 *  重写setText 在此设置AttributedText,可更改行间距，字间距等等属性
 */
- (void)setText:(NSString *)text
{
    if (!text) {
        return;
    }
    [super setText:text];
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:_lineSpace];
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paragraphStyle.alignment = [self textAlignment];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];

    [self setAttributedText:attributedString];
}
/**
 *  CopyingEnabled开关
 */
- (void)setCopyingEnabled:(BOOL)copyingEnabled
{
    if (_copyingEnabled != copyingEnabled)
    {
        [self willChangeValueForKey:@"copyingEnabled"];
        _copyingEnabled = copyingEnabled;
        [self didChangeValueForKey:@"copyingEnabled"];
        
        self.userInteractionEnabled = copyingEnabled;
        self.longPressGestureRecognizer.enabled = copyingEnabled;
    }
}

@end
