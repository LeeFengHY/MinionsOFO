//
//  OFOMinionesView.m
//  MinionsOFO
//
//  Created by QFWangLP on 2017/7/10.
//  Copyright © 2017年 leefenghy. All rights reserved.
//

#import "OFOMinionesView.h"
#import "MinionsEyesView.h"
#import "UIView+Extension.h"


@interface OFOMinionesView()
@property (nonatomic, strong) UIImageView * faceImageView;
@property (nonatomic, strong) UIImageView * glassView;
@property (nonatomic, strong) MinionsEyesView * leftEyeView;
@property (nonatomic, strong) MinionsEyesView * rightEyeView;

@end
@implementation OFOMinionesView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.faceImageView];
        [self addSubview:self.glassView];
        [self addSubview:self.leftEyeView];
        [self addSubview:self.rightEyeView];
    }
    return self;
}
#pragma mark lazy property
- (UIImageView *)faceImageView
{
    if (!_faceImageView) {
        _faceImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"minions_background_190x190_"]];
    }
    return _faceImageView;
}

- (UIImageView *)glassView
{
    if (!_glassView) {
        _glassView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"minions_grass_190x190_"]];
//        _glassView.layer.borderColor = [UIColor grayColor].CGColor;
//        _glassView.layer.borderWidth = 1.0;
    }
    return _glassView;
}
- (MinionsEyesView *)leftEyeView
{
    if (!_leftEyeView) {
        _leftEyeView = [[MinionsEyesView alloc] initWithFrame:CGRectZero];
//        _leftEyeView.layer.borderColor = [UIColor redColor].CGColor;
//        _leftEyeView.layer.borderWidth = 1.0;
    }
    return _leftEyeView;
}
- (MinionsEyesView *)rightEyeView
{
    if (!_rightEyeView) {
        _rightEyeView = [[MinionsEyesView alloc] initWithFrame:CGRectZero];
    }
    return _rightEyeView;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.faceImageView.frame = CGRectMake(0, 0, self.width, self.height);
    self.glassView.frame = CGRectMake(0, 0, self.width, self.height);
    self.leftEyeView.frame = CGRectMake(50, 50, 40, 40);
    self.rightEyeView.frame = CGRectMake(100, 50, 40, 40);
}
@end
