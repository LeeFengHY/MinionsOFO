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
        //设置更新频率0.01等于100HZ
        self.motionManager.accelerometerUpdateInterval = 0.01;
        [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
            CMAcceleration acceleration = accelerometerData.acceleration;
            NSLog(@"x:%f+++y:%f+++z:%f",acceleration.x,acceleration.y,acceleration.z);
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
                //NSLog(@"x:%0.2f++++y:%0.2f",x,y);
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
    self.eyeImageView.frame = CGRectMake(0, 0, 37 /2, 39 / 2);
    self.eyeImageView.center = CGPointMake(20, 20);
}
@end
