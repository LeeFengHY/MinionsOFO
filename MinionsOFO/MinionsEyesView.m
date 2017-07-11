//
//  MinionsEyesView.m
//  MinionsOFO
//
//  Created by QFWangLP on 2017/7/10.
//  Copyright © 2017年 leefenghy. All rights reserved.
//

#import "MinionsEyesView.h"
#import <CoreMotion/CoreMotion.h>
#import "UIView+Extension.h"
#import <math.h>
@interface MinionsEyesView ()
@property (nonatomic, strong) UIImageView *eyeImageView;
@property (nonatomic, strong) CMMotionManager *motionManager;
@end

@implementation MinionsEyesView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.velocity = 10;
        [self addSubview:self.eyeImageView];
        [self updateAccelerometer];
    }
    return self;
}
- (void)updateAccelerometer
{
    self.motionManager = [[CMMotionManager alloc] init];
    //加速计可用
    if (self.motionManager.isAccelerometerAvailable) {
        //设置更新时间
        self.motionManager.accelerometerUpdateInterval = 0.01;
        [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
            CMAcceleration acceleration = accelerometerData.acceleration;
            //NSLog(@"x:%f+++y:%f+++z:%f",acceleration.x,acceleration.y,acceleration.z);
            if (!error) {
                CGFloat x = self.eyeImageView.center.x + acceleration.x * self.velocity;
                CGFloat y = self.eyeImageView.center.y + acceleration.y * self.velocity;
                if (x < self.eyeImageView.width / 2) {
                    x = self.eyeImageView.width / 2;
                }else if (x > self.width - self.eyeImageView.width / 2){
                    x = self.width - self.eyeImageView.width / 2;
                }
                
                if (y < self.eyeImageView.height / 2) {
                    y = self.eyeImageView.height / 2;
                }else if (y > self.height - self.eyeImageView.height / 2)
                {
                    y = self.height - self.eyeImageView.height / 2;
                }
                self.eyeImageView.center = CGPointMake(x, y);
            }
            
            CGFloat r = self.width /2 - self.eyeImageView.width /2;
            CGPoint center = CGPointMake(self.width /2, self.height/2);
            CGPoint currentPoint = self.eyeImageView.center;
            //如果眼睛不要被这遮挡，需要以眼睛的center到self.center为半径画一个圆限制活动范围
            UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.eyeImageView.width /2, self.eyeImageView.height /2, self.width - self.eyeImageView.width, self.height - self.eyeImageView.height)];
            if (CGPathContainsPoint(path.CGPath, NULL, self.eyeImageView.center, NO)) {
                //在path园内
            }else {
                CGFloat x = 0;
                CGFloat y = 0;
                //斜边
                CGFloat c = sqrt(pow(center.x - currentPoint.x, 2) + pow(currentPoint.y - center.y, 2));
                //邻边
                CGFloat b = fabs(r * (center.x - currentPoint.x) / c);
                //对边
                CGFloat a = fabs(r * (currentPoint.y - center.y) / c);
                if (currentPoint.x > center.x) {
                    x = center.x + b;
                }else {
                    x = center.x - b;
                }
                if (currentPoint.y > center.y) {
                    y = center.y + a;
                }else {
                    y = center.y - a;
                }
                self.eyeImageView.center = CGPointMake(x, y);
            }
        }];
    }
}

- (UIImageView *)eyeImageView
{
    if (!_eyeImageView) {
        _eyeImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"minions_eyes_18x19_"]];
    }
    return _eyeImageView;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.backgroundColor = [UIColor clearColor];
    self.layer.cornerRadius = self.bounds.size.width / 2;
    self.clipsToBounds = YES;
    self.eyeImageView.frame = CGRectMake(0, 0, 37/2, 39/2);
    self.eyeImageView.center = CGPointMake(20, 20);
}
@end
