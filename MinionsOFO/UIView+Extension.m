//
//  UIView+Extension.m
//  MinionsOFO
//
//  Created by QFWangLP on 2017/7/10.
//  Copyright © 2017年 leefenghy. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)
- (CGFloat)x
{
    return self.frame.origin.x;
}
- (CGFloat)y
{
    return self.frame.origin.y;
}
- (CGFloat)width
{
    return self.frame.size.width;
}
- (CGFloat)height
{
    return self.frame.size.height;
}
- (CGFloat)centerX
{
    return self.center.x;
}
- (CGFloat)centerY
{
    return self.center.y;
}

- (CGSize)size
{
    return self.frame.size;
}
- (void)setX:(CGFloat)mx
{
    CGRect frame = self.frame;
    frame.origin.x = mx;
    self.frame = frame;
}
- (void)setY:(CGFloat)my
{
    CGRect frame = self.frame;
    frame.origin.y = my;
    self.frame = frame;
}
- (void)setWidth:(CGFloat)newWidth
{
    CGRect frame = self.frame;
    frame.size.width = newWidth;
    self.frame = frame;
}
- (void)setHeight:(CGFloat)newHeight
{
    CGRect newframe = self.frame;
    newframe.size.height = newHeight;
    self.frame = newframe;
}
- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}
- (void)setSize:(CGSize)newsize
{
    CGRect frame = self.frame;
    frame.size = newsize;
    self.frame = frame;
}
@end
